using Domain.Models.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class FamilyProfile : BaseEntity
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

        public bool? PeopleWithSpecialNeeds { get; set; }

        public long? ParentIdentifyImageID { get; set; }
        public Attachment? ParentIdentifyImage { get; set; }

    }
}
