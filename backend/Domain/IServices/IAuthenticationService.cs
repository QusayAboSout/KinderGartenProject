using Domain.DTOs.Authentication;
using Domain.Models.UserModels;
using Domain.Models.UserVerificationCodeModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IAuthenticationService
    {
        // Task<UserConfigurationDto> GetUserConfiguration(ClaimsPrincipal user);
        Task<AuthenticationDto> LoginAsync(LoginDto login);
        Task<UserVerificationCodeResult> ForgotPassword(ForgotPasswordDto forgotPasswordDto);
        Task<bool> CheckResetPasswordVerificationCode(CheckVerificationCodeDto checkVerificationCodeDto);
        Task<bool> ResetPasswordByVerificationCode(ResetPasswordByVerificationCodeDto resetPasswordByVerificationCodeDto);
        Task<AuthenticationDto> LoginImpersonateAsync(decimal userId);
        Task<AuthenticationDto> SiginUp(SignUpDto signUpDto);
        Task<UserVerificationCodeResult> SendEmailVerificationCode(string email);
        Task<bool> CheckEmailVerificationCode(CheckVerificationCodeDto checkVerificationCodeDto);
    }
}
