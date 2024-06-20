using AutoMapper;
using JWT.Infrastructure;
using Domain.Constants;
using Domain.IServices;
using Domain.Models;
using Domain.Models.CustomException;
using Domain.Models.UserModels;
using Microsoft.EntityFrameworkCore;
using Domain.Models.UserVerificationCodeModel;
using Domain.Interfaces;
using Domain.Models.Email;

namespace Domain.Services
{
    public class UserVerificationService : IUserVerificationService
    {
        private const int VerificationCodeMaxTime = 10;

        IRepository<User> _usersRepository;
        //IRepository<AppAction> _AppActionRepository;
        IJwtAuthManager _jwtAuthManager;
        //IUnitOfWork _UnitOfWork;
        IMapper _mapper;
        IEmailSender _EmailSender;
        IRepository<UserVerificationCode> _UserVerificationCodeRepository;

        public UserVerificationService(IRepository<User> usersRepository, IJwtAuthManager jwtAuthManager, IMapper mapper, IEmailSender emailSender, IRepository<UserVerificationCode> userVerificationCodeRepository)
        {
            _usersRepository = usersRepository;
            _jwtAuthManager = jwtAuthManager;
            _mapper = mapper;
            _EmailSender = emailSender;
            _UserVerificationCodeRepository = userVerificationCodeRepository;
        }

        public void ForgotPasswordValidation(ForgotPasswordChanalDto changePasswordDto, User? user)
        {
            if (user == null) throw new CustomException("Invalid_Information");
            if (user.IsActive == false) throw new CustomException("User_Not_Active");

            switch (changePasswordDto.ChannelType)
            {
                case NotificaitonChannelTypes.Email:
                    if (string.IsNullOrEmpty(user.Email) /*|| user.Email != forgotPasswordDto.Email.Trim()*/) throw new CustomException("User_Dose_Not_Have_Email");
                    break;
                default:
                    break;
            }
        }

        public async Task<UserVerificationCodeCreationDto> SetResetPasswordUserVerificationCode(User user)
        {
            var verificationCode = GeneralMethods.GenerateRandomString(6);

            var lastVerificationCode = await _UserVerificationCodeRepository.Get(e => e.UserId == user.ID).FirstOrDefaultAsync();
            var result = new UserVerificationCodeCreationDto()
            {
                IsValid = false,
                UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(lastVerificationCode)
            };
            if (lastVerificationCode == null)
            {
                result.UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(await CreateResetPasswordVerificationCode(user, verificationCode));
                result.IsValid = true;

            }
            else
            {
                if (ValidateVerificationCode(lastVerificationCode))
                {
                    result.UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(await SetNewVerificationCode(lastVerificationCode, verificationCode));
                    result.IsValid = true;

                }
                else return result;

            }
            return result;
        }
        public async Task<UserVerificationCodeCreationDto> SetCheckEmailVerificationCode(string email)
        {
            var verificationCode = GeneralMethods.GenerateRandomString(6);

            var lastVerificationCode = await _UserVerificationCodeRepository.Get(e => e.Email == email).FirstOrDefaultAsync();
            var result = new UserVerificationCodeCreationDto()
            {
                IsValid = false,
                UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(lastVerificationCode)
            };
            if (lastVerificationCode == null)
            {
                result.UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(await CreateCheckEmailVerificationCode(email, verificationCode));
                result.IsValid = true;

            }
            else
            {
                if (ValidateVerificationCode(lastVerificationCode))
                {
                    result.UserVerificationCode = _mapper.Map<UserVerificationCodeDto>(await SetNewVerificationCode(lastVerificationCode, verificationCode));
                    result.IsValid = true;

                }
                else return result;

            }
            return result;
        }
        private async Task<UserVerificationCode?> CreateResetPasswordVerificationCode(User user, string verificationCode)
        {
            var UserVerificationCode = new UserVerificationCode()
            {
                UserId = user.ID,
                Code = verificationCode,
                IsActive = true,
                ExpiredDate = DateTime.Now.AddMinutes(VerificationCodeMaxTime),
                CreateDate = DateTime.Now,
                RequestCount = 1
            };
            await _UserVerificationCodeRepository.Add(UserVerificationCode);
            return UserVerificationCode;
        }
        private async Task<UserVerificationCode?> CreateCheckEmailVerificationCode(string email, string verificationCode)
        {
            var UserVerificationCode = new UserVerificationCode()
            {
                Code = verificationCode,
                Email = email,
                IsActive = true,
                ExpiredDate = DateTime.Now.AddMinutes(VerificationCodeMaxTime),
                CreateDate = DateTime.Now,
                RequestCount = 1
            };
            await _UserVerificationCodeRepository.Add(UserVerificationCode);
            return UserVerificationCode;
        }

        private bool ValidateVerificationCode(UserVerificationCode lastVerificationCode)
        {
            return true;
        }
        private async Task<UserVerificationCode> SetNewVerificationCode(UserVerificationCode lastVerificationCode, string verificationCode)
        {
            if (lastVerificationCode.IsActive)
                ++lastVerificationCode.RequestCount;
            else
                lastVerificationCode.RequestCount = 1;
            lastVerificationCode.Code = verificationCode;
            lastVerificationCode.IsActive = true;
            lastVerificationCode.CreateDate = DateTime.Now;
            lastVerificationCode.ExpiredDate = DateTime.Now.AddMinutes(VerificationCodeMaxTime);

            await _UserVerificationCodeRepository.Update(lastVerificationCode);

            return lastVerificationCode;
        }


        public UserVerificationCodeResult CreateUserVerificationCodeResult(User user, UserVerificationCodeCreationDto userVerificationCodeCreation, ForgotPasswordChanalDto forgotPasswordDto)
        {
            var result = _mapper.Map<UserVerificationCodeResult>(userVerificationCodeCreation.UserVerificationCode);
            result.WaitError = !userVerificationCodeCreation.IsValid;
            switch (forgotPasswordDto.ChannelType)
            {
                case NotificaitonChannelTypes.Email:
                    if (user.Email.Contains('@'))
                        result.Email = user.Email.Substring(0, 3) + "*******@" + user.Email.Split('@')[1];
                    break;
                default:
                    break;
            }
            return result;

        }
        public void SendVerificationCodeToUser(string mobileNo, string email, UserVerificationCodeDto userVerificationCode, NotificaitonChannelTypes channelType)
        {
            if (channelType == NotificaitonChannelTypes.Email && !string.IsNullOrEmpty(email))
                SendResetPasswordVerificationCodeByEmail(email, userVerificationCode);
            if (channelType == NotificaitonChannelTypes.MobileSMS && !string.IsNullOrEmpty(mobileNo))
                SendResetPasswordVerificationCodeByMobileSMS(mobileNo, userVerificationCode);

        }


        private void SendResetPasswordVerificationCodeByMobileSMS(string mobile, UserVerificationCodeDto userVerificationCode)
        {
            if (string.IsNullOrEmpty(mobile))
                return;
            throw new CustomException("Not_Handle");

        }


        private void SendResetPasswordVerificationCodeByEmail(string email, UserVerificationCodeDto userVerificationCode)
        {
            if (string.IsNullOrEmpty(email))
                return;
            var content = $"Verification Code: {userVerificationCode.Code}";
            var message = new EmailMessage(new[] { email }, "Your Kinder garden veryfing code :)", content);
            _EmailSender.SendEmail(message);
        }
        public void SendCheckEmailVerificationCodeByEmail(string email, UserVerificationCodeDto userVerificationCode)
        {
            if (string.IsNullOrEmpty(email))
                return;
            var content = $"Check Email Code is: {userVerificationCode.Code}";
            var message = new EmailMessage(new[] { email }, "Workmant Check Email", content);
            _EmailSender.SendEmail(message);
        }
        public async Task<UserVerificationCode> GetUserVerificationCodeByCode(User user, string verificationCode)
        {

            if (user.IsActive == false) throw new CustomException("User_Not_Active");
            var lastVerificationCode = await _UserVerificationCodeRepository.Get(e => e.UserId == user.ID && e.IsActive).FirstOrDefaultAsync();
            if (lastVerificationCode == null) throw new CustomException("Invalid_Information");
            if (string.IsNullOrEmpty(verificationCode) || lastVerificationCode.Code.ToLower() != verificationCode.Trim().ToLower()) throw new CustomException("VerificationCode_Not_Valid");
            return lastVerificationCode;
        }
        public async Task<UserVerificationCode> GetEmailVerificationCodeByCode(string email, string verificationCode)
        {

            var lastVerificationCode = await _UserVerificationCodeRepository.Get(e => e.Email == email && e.IsActive).FirstOrDefaultAsync();
            if (lastVerificationCode == null) throw new CustomException("Invalid_Information");
            if (string.IsNullOrEmpty(verificationCode) || lastVerificationCode.Code.ToLower() != verificationCode.Trim().ToLower()) throw new CustomException("VerificationCode_Not_Valid");
            return lastVerificationCode;
        }
        public async Task<bool> CheckCodeValidation(string email, string verificationCode)
        {

            var lastVerificationCode = await _UserVerificationCodeRepository.Get(e => e.Email == email && e.IsActive).FirstOrDefaultAsync();
            if (lastVerificationCode == null) throw new CustomException("Invalid_Information");
            if (string.IsNullOrEmpty(verificationCode) || lastVerificationCode.Code.ToLower() != verificationCode.Trim().ToLower()) return false;
            return true;
        }

    }
}
