using JWT.Attributes;
using Domain.Constants;
using Domain.IServices;
using Domain.Models.UserModels;

using Domain.Services;
using Microsoft.AspNetCore.Mvc;
using Domain.Models.UserVerificationCodeModel;
using Domain.DTOs.Authentication;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        IAuthenticationService _authenticationService;
        IUserServices _UserService;
        public AuthenticationController(IAuthenticationService authenticationService, IUserServices userService)
        {
            _authenticationService = authenticationService;
            _UserService = userService;
        }
        [Auth(Public = true)]
        [HttpPost("Login")]
        public async Task<AuthenticationDto> Login(LoginDto loginVM)
        {
            return await _authenticationService.LoginAsync(loginVM);
        }
        [Auth(Public = true)]
        [HttpPost("SiginUp")]
        public async Task<AuthenticationDto> SiginUp(SignUpDto signUpDto)
        {
            return await _authenticationService.SiginUp(signUpDto);
        }
        [Auth(Public = true)]
        [HttpPost("ForgotPassword")]
        public async Task<UserVerificationCodeResult> ForgotPassword([FromBody] ForgotPasswordDto forgotPasswordDto)
        {
            return await _authenticationService.ForgotPassword(forgotPasswordDto);
        }
        [Auth(Public = true)]
        [HttpPost("CheckResetPasswordVerificationCode")]
        public async Task<bool> CheckResetPasswordVerificationCode([FromBody] CheckVerificationCodeDto checkVerificationCodeDto)
        {
            return await _authenticationService.CheckResetPasswordVerificationCode(checkVerificationCodeDto);
        }
        [Auth(Public = true)]
        [HttpPost("SendEmailVerificationCode")] 
        public async Task<UserVerificationCodeResult> SendEmailVerificationCode([FromBody] SendEmailVerificationDto sendEmailVerificationDto)
        {
            return await _authenticationService.SendEmailVerificationCode(sendEmailVerificationDto.Email);
        }
        [Auth(Public = true)]
        [HttpPost("CheckEmailVerificationCode")]
        public async Task<bool> CheckEmailVerificationCode([FromBody] CheckVerificationCodeDto checkVerificationCodeDto)
        {
            return await _authenticationService.CheckEmailVerificationCode(checkVerificationCodeDto);
        }
        [Auth(Public = true)]
        [HttpPost("ResetPasswordByVerificationCode")]
        public async Task<bool> ResetPasswordByVerificationCode([FromBody] ResetPasswordByVerificationCodeDto resetPasswordByVerificationCodeDto)
        {
            return await _authenticationService.ResetPasswordByVerificationCode(resetPasswordByVerificationCodeDto);
        }



        [Auth()]
        [HttpPost("LoginImpersonate")]
        public async Task<AuthenticationDto> LoginImpersonate([FromBody] decimal userId)
        {
            return await _authenticationService.LoginImpersonateAsync(userId);
        }


    }
}
