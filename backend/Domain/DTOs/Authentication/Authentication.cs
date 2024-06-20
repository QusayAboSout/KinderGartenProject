using Domain.Models.UserModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.DTOs.Authentication
{
    public class AuthenticationDto
    {
        public long UserID { get; set; }
        public string AuthToken { get; set; }
        public string RefreshToken { get; set; }
        public DateTime ExpiresIn { get; set; }
    }
}
