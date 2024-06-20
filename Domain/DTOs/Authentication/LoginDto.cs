﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.DTOs.Authentication
{
    public class LoginDto
    {
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? GoogleAuthTokin { get; set; }
    }
}
