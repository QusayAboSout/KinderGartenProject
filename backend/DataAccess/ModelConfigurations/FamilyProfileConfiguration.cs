using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class FamilyProfileConfiguration
    {
        public FamilyProfileConfiguration(EntityTypeBuilder<FamilyProfile> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreatData());
        }

        private List<FamilyProfile> CreatData()
        {
            return new List<FamilyProfile>()
            {
                new FamilyProfile()
                {
                    ID = 1,
                    Address = "Hebron - samou",
                    EmergencyPhoneNumber = "982392298",
                    FamilyName = "ABS GM",
                    FatherEducationLevel = "GM",
                    FatherName = "Xsharawi",
                    FatherProfession = "Amazon SEO",
                    FatherWorkPhone = "0000000342",
                    FatherWorkPlace = "Hell",
                    GrandFatherName = "Xsharawi GRAND ORDER",
                    MotherEducationLevel = "Master",
                    MotherWorkPhone = "2938283",
                    MotherWorkPlace = "9823382",
                    NumberOfDaughters = 5,
                    PeopleWithSpecialNeeds = true,
                    NumberOfSons = 3,
                    NumberOfSpicailNeeds = 4,
                    ParentIdentifyImage = null,
                    ParentIdentifyImageID = null,
                    ParentsSituation = "togather",
                    phoneNumber = "02323774",
                    UserID = 3,
                },
            };
        }
    }
}
