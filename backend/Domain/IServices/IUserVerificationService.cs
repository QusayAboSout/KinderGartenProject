using Domain.Constants;
using Domain.Models.UserModels;
using Domain.Models.UserVerificationCodeModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;
using Domain.Models;

namespace Domain.IServices
{
    [ScopedService]
    public interface IUserVerificationService
    {
        void ForgotPasswordValidation(ForgotPasswordChanalDto changePasswordDto, User? user);
        Task<UserVerificationCodeCreationDto> SetResetPasswordUserVerificationCode(User user);
        Task<UserVerificationCodeCreationDto> SetCheckEmailVerificationCode(string email);
        Task<UserVerificationCode> GetUserVerificationCodeByCode(User user, string verificationCode);
        Task<UserVerificationCode> GetEmailVerificationCodeByCode(string email, string verificationCode);
        Task<bool> CheckCodeValidation(string email, string verificationCode);
        void SendVerificationCodeToUser(string mobileNo, string email, UserVerificationCodeDto userVerificationCode, NotificaitonChannelTypes channelType);
        void SendCheckEmailVerificationCodeByEmail(string email, UserVerificationCodeDto userVerificationCode);
        UserVerificationCodeResult CreateUserVerificationCodeResult(User user, UserVerificationCodeCreationDto userVerificationCodeCreation, ForgotPasswordChanalDto forgotPasswordDto);
    }
}
