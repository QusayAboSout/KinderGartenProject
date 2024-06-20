using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.UserModels
{
    public class ForceChangePasswordDto
    {
        public decimal UserId { get; set; }
        public string NewPassword { get; set; }
    }
}
