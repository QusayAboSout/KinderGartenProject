using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Models;
using Domain.Models.Base;
using Microsoft.EntityFrameworkCore;
using static Domain.Constants.ApiActions;

namespace Domain.Models
{
    public partial class UserVerificationCode : BaseEntity
    {
        
        public long? UserId { get; set; }
        public string? Email { get; set; }
        public string Code { get; set; } = null!;
        public DateTime ExpiredDate { get; set; }
        public bool IsActive { get; set; }
        public int RequestCount { get; set; }
        public DateTime CreateDate { get; set; }
        public virtual User User { get; set; } = null!;
    }
}
