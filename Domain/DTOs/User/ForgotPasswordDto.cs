using Domain.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.UserModels
{
    public class ForgotPasswordChanalDto
    {
        public NotificaitonChannelTypes ChannelType { get; set; }

    }
    public class ForgotPasswordDto: ForgotPasswordChanalDto
    {
        public string Email { get; set; }
        //public string? Email { get; set; }
        //public string? MobileNumber { get; set; }

    }
    public class CheckVerificationCodeDto
    {
        public string Email { get; set; }
        public string VerificationCode { get; set; }

    }
    public class ResetPasswordByVerificationCodeDto : CheckVerificationCodeDto
    {
        public string NewPassword { get; set; }

    }

    public class ChangeProfilePasswordDto
    {
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }

    }





}
