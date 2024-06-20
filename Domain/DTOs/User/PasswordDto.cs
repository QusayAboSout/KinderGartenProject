using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.UserModels
{
    public class PasswordDto
    {
        public string EncryptionPassword { get; set; }
        public string Password { get; set; }
    }
}
