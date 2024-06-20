using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.UserVerificationCodeModel
{
    public class UserVerificationCodeResult
    {
        public bool WaitError { get; set; }
        public DateTime ExpiredDate { get; set; }
        public int RequestCount { get; set; }
        public DateTime CreateDate { get; set; }
        public string? Email { get; set; }
    }

    public class UserVerificationCodeCreationDto
    {
        public UserVerificationCodeDto UserVerificationCode { get; set; }
        public bool IsValid = false;
    }
    public class UserVerificationCodeDto
    {
        public decimal UserId { get; set; }
       
        public string Code { get; set; } = null!;
        public DateTime ExpiredDate { get; set; }
        public bool IsActive { get; set; }
        public int RequestCount { get; set; }
        public DateTime CreateDate { get; set; }
    }


}
