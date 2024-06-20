using AutoMapper;
using Domain.IServices;
using Domain.Models.CustomException;
using Domain.Models.UserModels;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Domain.Constants;
using Domain.Models.UserVerificationCodeModel;
using Domain.Interfaces;
using Domain.Models;
using Domain.Models.Email;
using Domain.DTOs.User;

namespace Domain.Services
{
    public class UserService : GeneralServices<User>, IUserServices
    {
        IRepository<User> _userRepository;
        IEmailSender _EmailSender;
        IMapper _mapper;
        IRepository<UserVerificationCode> _UserVerificationCodeRepository;
        IUserVerificationService _UserVerificationService;

        public UserService(IRepository<User> userRepository, IEmailSender emailSender, IMapper mapper, IRepository<UserVerificationCode> userVerificationCodeRepository, IUserVerificationService userVerificationService)
            : base(userRepository, mapper)
        {
            _userRepository = userRepository;
            _EmailSender = emailSender;
            _mapper = mapper;
            _UserVerificationCodeRepository = userVerificationCodeRepository;
            _UserVerificationService = userVerificationService;
        }






        public async Task<UserDto> AddUser(UserDto addUserDto)
        {
            Validation(addUserDto);
            var user = _mapper.Map<User>(addUserDto);
            var passwordDto = HandelPassword(addUserDto, user);
            user = await _userRepository.Add(user);
            passwordDto = HandelPassword(addUserDto, user);
            //SendPasswordByEmail(user.Email, passwordDto.Password);
            await _userRepository.Update(user);
            return _mapper.Map<UserDto>(user);
        }
        public async Task<UserDto> UpdateUser(UserDto userDto)
        {
            var user = await _userRepository.Get(e => e.ID == userDto.ID).FirstOrDefaultAsync();
            if (user == null)
                throw new CustomException("User_Not_Found");

            _mapper.Map(userDto, user);
            await _userRepository.Update(user);
            return _mapper.Map<UserDto>(user);

        }

        public PasswordDto HandelPassword(UserDto addUserDto, User user)
        {
            var passwordDto = new PasswordDto();
            passwordDto.Password = addUserDto.Password;

            passwordDto.EncryptionPassword = GeneralMethods.GetEncryptionPassword(passwordDto.Password, user.ID);

            user.Password = passwordDto.EncryptionPassword;
            return passwordDto;
        }


        private void SendPasswordToUser(string mobileNo, string email, string password, NotificaitonChannelTypes channelType)
        {
            if (channelType == NotificaitonChannelTypes.Email && !string.IsNullOrEmpty(email))
                SendPasswordByEmail(email, password);
            if (channelType == NotificaitonChannelTypes.MobileSMS && !string.IsNullOrEmpty(mobileNo))
                SendPasswordByMobileSMS(mobileNo, password);

        }

        private void SendPasswordByMobileSMS(string mobile, string password)
        {
            if (string.IsNullOrEmpty(mobile))
                return;

        }


        private void SendPasswordByEmail(string email, string password)
        {
            if (string.IsNullOrEmpty(email))
                return;
            var content = $"Password: {password}";
            var message = new EmailMessage(new[] { email }, "You HJC Account Password", content);
            _EmailSender.SendEmail(message);
        }



        private void Validation(UserDto addUserDto)
        {
            var errors = new List<ExceptionMessage>();
            //var isDuplicateEmail = _userRepository.Get(e => e.Email == addUserDto.Email && e.Isactive).Any();
            //if (isDuplicateEmail)
            //    errors.Add(new ExceptionMessage() { messageCode = "Email_Is_Exist" });
            //var isDuplicateLoginName = _userRepository.Get(e => e.LoginName == addUserDto.LoginName && e.Isactive).Any();
            //if (isDuplicateLoginName)
            //    errors.Add(new ExceptionMessage() { messageCode = "LoginName_Is_Exist" });
            //if (errors.Any())
            //    throw new CustomException(errors);


        }

        public async Task<bool> ForceChangePassword(ForceChangePasswordDto changePasswordDto)
        {
            var user = await _userRepository.Get(e => e.ID == changePasswordDto.UserId).FirstOrDefaultAsync();
            if (user == null) throw new CustomException("User_Not_Found");
            user.Password = GeneralMethods.GetEncryptionPassword(changePasswordDto.NewPassword, user.ID);
            await _userRepository.Update(user);
            return true;

        }
        public async Task<bool> ResetPassword(ClaimsPrincipal userPrincipal)
        {

            var userId = GeneralMethods.GetUserID(userPrincipal);
            // var user = await _userRepository.Get(e => e.UserId == userId).FirstOrDefaultAsync();
            //if (user == null) throw new CustomException("User_Not_Found");
            //var newPassword = GeneralMethods.GenerateRandomString(10, true);
            //user.AppPassword = GeneralMethods.GetEncryptionPassword(newPassword, user.UserId);
            //SendPasswordByEmail(user.Email, newPassword);
            //user.ForceChangePassword = true;
            //await _userRepository.Update(user);
            return true;

        }



        public async Task<UserVerificationCodeResult> SendVerificationCodeForChangePassword(ChangeProfilePasswordDto changePasswordDto, ClaimsPrincipal userPrincipal)
        {
            var userId = GeneralMethods.GetUserID(userPrincipal);
            //var user = await _userRepository.Get(e => e.UserId == userId).FirstOrDefaultAsync();
            //_UserVerificationService.ForgotPasswordValidation(changePasswordDto, user);
            //CheckOldPasswordValidation(changePasswordDto, user);
            //_UnitOfWork.BeginTransaction();
            //UserVerificationCodeResult result;
            //var userVerificationCodeCreation = await _UserVerificationService.SetUserVerificationCode(user);
            //if (!userVerificationCodeCreation.IsValid)
            //    return _UserVerificationService.CreateUserVerificationCodeResult(user, userVerificationCodeCreation, changePasswordDto);

            //_UnitOfWork.CommitTransaction();
            //_UserVerificationService.SendVerificationCodeToUser(user.MobileNumber, user.Email, userVerificationCodeCreation.UserVerificationCode, changePasswordDto.ChannelType);
            //return _UserVerificationService.CreateUserVerificationCodeResult(user, userVerificationCodeCreation, changePasswordDto); ;
            return null;
        }

        private void CheckOldPasswordValidation(ChangeProfilePasswordDto changePasswordDto, User user)
        {
            var newPassword = GeneralMethods.GetEncryptionPassword(changePasswordDto.NewPassword, user.ID);
            var oldPassword = GeneralMethods.GetEncryptionPassword(changePasswordDto.OldPassword, user.ID);
            if (!GeneralMethods.CheckPassword( user.Password, changePasswordDto.OldPassword, user.ID)) throw new CustomException("Old_Password_Not_Currect");
            if (changePasswordDto.NewPassword == changePasswordDto.OldPassword) throw new CustomException("New_Password_Must_Be_Defferent_From_Old_Password");
        }


        public async Task<bool> ChangePassword(ChangeProfilePasswordDto changeProfilePasswordDto, ClaimsPrincipal userPrincipal)
        {
            var userId = GeneralMethods.GetUserID(userPrincipal);
            var user = await _userRepository.Get(e => e.ID == userId).FirstOrDefaultAsync();
            if (user == null) throw new CustomException("User_Not_Found");

            CheckOldPasswordValidation(changeProfilePasswordDto,user);
            user.Password = GeneralMethods.GetEncryptionPassword(changeProfilePasswordDto.NewPassword, user.ID);
            await _userRepository.Update(user);
            return true;
        }
    }
}
