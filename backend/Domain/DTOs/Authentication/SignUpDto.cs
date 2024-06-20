using Domain.DTOs.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.DTOs.Authentication
{
    public class SignUpDto
    {
        public UserDto User { get; set; }
        public string? Code { get; set; }

    }

    public class SendEmailVerificationDto
    {
        public string Email { get; set; }
    }
}
