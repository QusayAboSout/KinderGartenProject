using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.DTOs.Authentication
{


    public partial class UserGoogleData
    {
        public string Id { get; set; }

        public string Email { get; set; }

        public bool VerifiedEmail { get; set; }

        public string Name { get; set; }

        public string GivenName { get; set; }

        public string FamilyName { get; set; }

        public Uri Picture { get; set; }

        public string Locale { get; set; }
    }


}
