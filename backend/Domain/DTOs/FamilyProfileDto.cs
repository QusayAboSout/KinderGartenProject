using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class FamilyProfileDto : BaseDto
    {
        public long? UserID { get; set; }

        public long? NumberOfSons { get; set; }
        public long? NumberOfDaughters { get; set; }
        public long? NumberOfSpicailNeeds { get; set; }

        public string? FatherName { get; set; }  
        public string? GrandFatherName { get; set; }  
        public string? FamilyName { get; set; }
        public string? Address { get; set; }
        public string? FatherProfession { get; set; }
        public string? FatherWorkPhone { get; set; }
        public string? FatherWorkPlace { get; set; }
        public string? phoneNumber { get; set; }
        public string? MotherWorkPhone { get; set; }
        public string? MotherWorkPlace { get; set; }
        public string? FatherEducationLevel { get; set; }
        public string? MotherEducationLevel { get; set; }
        public string? EmergencyPhoneNumber { get; set; }
        public string? ParentsSituation { get; set; }

        public long? NumberOfPeopleWithSpecialNeeds { get; set; }

        public long? ParentIdentifyImageID { get; set; }

    }
}
