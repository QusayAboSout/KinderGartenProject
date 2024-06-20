using AutoMapper;
using JWT.Infrastructure;
using Domain.Constants;
using Domain.IServices;
using Domain.Models;
using Domain.Models.CustomException;
using Domain.Models.Email;
using Domain.Models.UserModels;

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Domain.Models.UserVerificationCodeModel;
using Domain.Interfaces;
using Domain.DTOs.Authentication;
using Microsoft.AspNetCore.Connections;

namespace Domain.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private const int VerificationCodeMaxTime = 10;

        IRepository<User> _usersRepository;
        IUserServices _UserService;
        IJwtAuthManager _jwtAuthManager;
        IMapper _mapper;
        IEmailSender _EmailSender;
        IRestApiService _RestApiService;
        IRepository<UserVerificationCode> _UserVerificationCodeRepository;
        IUserVerificationService _UserVerificationService;

        public AuthenticationService(IRepository<User> usersRepository, IUserServices userService, IJwtAuthManager jwtAuthManager, IMapper mapper, IEmailSender emailSender, IRestApiService restApiService, IRepository<UserVerificationCode> userVerificationCodeRepository, IUserVerificationService userVerificationService)
        {
            _usersRepository = usersRepository;
            _UserService = userService;
            _jwtAuthManager = jwtAuthManager;
            _mapper = mapper;
            _EmailSender = emailSender;
            _RestApiService = restApiService;
            _UserVerificationCodeRepository = userVerificationCodeRepository;
            _UserVerificationService = userVerificationService;
        }

        public async Task<AuthenticationDto> LoginAsync(LoginDto login)
        {
            var user = _usersRepository.Get().Where(user => user.Email == login.UserName || user.UserName == login.UserName).FirstOrDefault();
            if (user == null)
                throw new CustomException("يوجد خطأ في اسم المستخدم أو كلمة المرور");
            if (!user.IsActive)
                throw new CustomException("User_not_active");
            if (!CheckPassword(user.Password, login.Password, user.ID))
            {
                //user.NumberOfWrongLogin++;
                //await _usersRepository.update(user);
                throw new CustomException("يوجد خطأ في اسم المستخدم أو كلمة المرور");
            }
            var authenticationModel = GenerateToken(user.UserName, user.ID);
            return authenticationModel;
        }
        private bool CheckPassword(string savedPassword, string? password, long userId)
        {
            if (string.IsNullOrEmpty(savedPassword) || string.IsNullOrEmpty(password))
                return false;
            // return GeneralMethods.CheckPassword(savedPassword, password, userId);
            ///
            if (savedPassword == password)
            {
                return true;
            }
            return false;
            ///
        }
        private AuthenticationDto GenerateToken(string userName, long id)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name,userName),
                new Claim("ID",id.ToString()),
            };

            var jwtResult = _jwtAuthManager.GenerateTokens(userName, claims, DateTime.Now);

            return new AuthenticationDto
            {
                UserID = id,
                AuthToken = jwtResult.AccessToken,
                RefreshToken = jwtResult.RefreshToken.TokenString,
                ExpiresIn = jwtResult.RefreshToken.ExpireAt
            };
        }


        public async Task<UserVerificationCodeResult> ForgotPassword(ForgotPasswordDto forgotPasswordDto)
        {
            var user = await _usersRepository.Get(e => e.Email.ToLower() == forgotPasswordDto.Email.Trim().ToLower()).FirstOrDefaultAsync();
            _UserVerificationService.ForgotPasswordValidation(forgotPasswordDto, user);
            UserVerificationCodeResult result;
            var userVerificationCodeCreation = await _UserVerificationService.SetResetPasswordUserVerificationCode(user);
            if (!userVerificationCodeCreation.IsValid)
                return _UserVerificationService.CreateUserVerificationCodeResult(user, userVerificationCodeCreation, forgotPasswordDto);
            _UserVerificationService.SendVerificationCodeToUser(null, user.Email, userVerificationCodeCreation.UserVerificationCode, forgotPasswordDto.ChannelType);
            return _UserVerificationService.CreateUserVerificationCodeResult(user, userVerificationCodeCreation, forgotPasswordDto); ;
        }



        public async Task<bool> CheckResetPasswordVerificationCode(CheckVerificationCodeDto checkVerificationCodeDto)
        {
            var result = await GetResetPasswordUserVerificationCodeByCode(checkVerificationCodeDto);
            return result != null;
        }
        public async Task<bool> CheckEmailVerificationCode(CheckVerificationCodeDto checkVerificationCodeDto)
        {
            var result = await _UserVerificationService.CheckCodeValidation(checkVerificationCodeDto.Email, checkVerificationCodeDto.VerificationCode);
            return result;
        }



        private async Task<UserVerificationCode> GetResetPasswordUserVerificationCodeByCode(CheckVerificationCodeDto checkVerificationCodeDto)
        {
            var user = await _usersRepository.Get(e => e.Email.ToLower() == checkVerificationCodeDto.Email.Trim().ToLower()).FirstOrDefaultAsync();
            if (user == null) throw new CustomException("Invalid_Information");
            return await _UserVerificationService.GetUserVerificationCodeByCode(user, checkVerificationCodeDto.VerificationCode);
        }

        public async Task<bool> ResetPasswordByVerificationCode(ResetPasswordByVerificationCodeDto resetPasswordByVerificationCodeDto)
        {
            var verificationCode = await GetResetPasswordUserVerificationCodeByCode(resetPasswordByVerificationCodeDto);
            if (verificationCode == null)
                throw new CustomException("VerificationCode_Not_Valid");
            var user = await _usersRepository.Get(e => e.Email == resetPasswordByVerificationCodeDto.Email).FirstOrDefaultAsync();
            if (user == null) throw new CustomException("LoginName_NotValid");
            user.Password = GeneralMethods.GetEncryptionPassword(resetPasswordByVerificationCodeDto.NewPassword, user.ID);
            await _usersRepository.Update(user);
            verificationCode.IsActive = false;
            await _UserVerificationCodeRepository.Update(verificationCode);
            return true;
        }



        public async Task<AuthenticationDto> LoginImpersonateAsync(decimal userId)
        {

            //var user = _usersRepository.Get().Where(user => user.UserId == userId).FirstOrDefault();
            //if (user == null)
            //    throw new CustomException("Wrong_Username_Or_Password");
            //if (!user.Isactive)
            //    throw new CustomException("User_not_active");
            //var authenticationModel = GenerateToken(user.UserName, user.UserId);
            //return authenticationModel;
            return null;
        }

        public async Task<AuthenticationDto> SiginUp(SignUpDto signUpDto)
        {
            if (!string.IsNullOrEmpty(signUpDto.Code))
            {
                var verification = await _UserVerificationService.GetEmailVerificationCodeByCode(signUpDto.User.Email, signUpDto.Code);
                if (verification == null)
                    throw new CustomException("VerificationCode_Not_Valid");

            }
            else if (!string.IsNullOrEmpty(signUpDto.User.GoogleAccessToken))
            {
                var result = await _RestApiService.Get<UserGoogleData>($"https://www.googleapis.com/oauth2/v1/userinfo?access_token={signUpDto.User.GoogleAccessToken}");
                if (result.Email != signUpDto.User.Email)
                {
                    throw new CustomException("Verification_Not_Valid");
                }
            }
            else
            {
                throw new CustomException("Verification_Not_Valid");
            }

            var userEntity = _mapper.Map<User>(signUpDto.User);
            // userEntity.Role = "student";

            //var passwordDto = _UserService.HandelPassword(signUpDto.User, userEntity);
            var user = await _usersRepository.Add(userEntity);
            //passwordDto = _UserService.HandelPassword(signUpDto.User, user);
            await _usersRepository.Update(user);
            var authenticationModel = GenerateToken(user.UserName, user.ID);
            return authenticationModel;
        }

        public async Task<UserVerificationCodeResult> SendEmailVerificationCode(string email)
        {
            var userVerificationCodeCreation = await _UserVerificationService.SetCheckEmailVerificationCode(email);
            if (!userVerificationCodeCreation.IsValid)
            {
                var userVerificationCodeResult = _mapper.Map<UserVerificationCodeResult>(userVerificationCodeCreation.UserVerificationCode);
                userVerificationCodeResult.WaitError = !userVerificationCodeCreation.IsValid;
                return userVerificationCodeResult;
            }
            _UserVerificationService.SendVerificationCodeToUser(null, email, userVerificationCodeCreation.UserVerificationCode, NotificaitonChannelTypes.Email);
            var result = _mapper.Map<UserVerificationCodeResult>(userVerificationCodeCreation.UserVerificationCode);
            result.WaitError = !userVerificationCodeCreation.IsValid;

            return result;

        }

    }
}
