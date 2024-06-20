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
    public class ChildCardConfiguration
    {
        public ChildCardConfiguration(EntityTypeBuilder<ChildCard> entityTypeBuilder)
        {
            // entityTypeBuilder.HasData(CreatData());
        }

        private List<ChildCard> CreatData()
        {
            return new List<ChildCard>()
            {
                new ChildCard()
                {
                    ID = IDs.ChildCard.Card1,
                    BirthOfDate = "2016/5/1",
                    CardFillDate = DateTime.Now,
                    NumberOfBrothers = 5,
                    NumberOfSisters = 5,
                    ChildArrangement = 2,
                    NumberOfSpicailNeeds = 0,
                    KindergartenName = "روضة نور الإيمان الخاصة",
                    StudentName = "محمد",
                    FatherName = "ادم",
                    GrandFatherName = "إبراهيم",
                    FamilyName = "عواوده",
                    BirthPlace = "يطا",
                    Nationality = "فلسطيني",
                    Religion = "مسلم",
                    Address = "السموع-رافات-الحنو",
                    FatherProfession = "أستاذ",
                    FatherWorkPhone = "05992823712",
                    FatherWorkPlace = "الخليل",
                    MotherWorkPhone = "059181722",
                    MotherWorkPlace = "Not working",
                    FatherEducationLevel = "باكالوريوس",
                    MotherEducationLevel = "None",
                    EmergencyPhoneNumber = "None",
                    childLivesWith = "الوالدين",
                    ParentsSituation = "متوسط",
                    DiseasesOfTheChild = "لا يوجد",
                    TheAuthoritySupervisingDisability = "لا يوجد",
                    ExtraInfo = "لا يوجد",
                    GurdianName = "إبراهيم عواودة",
                    TeacherName = "راما رواشدة",
                    ManegerName = "هنا عواودة",
                    TheTypeOfConditionTheChildIsFacing = "لا يوجد",
                    ConditionDescription = "الوصف",
                    ConditionReasons = "لا يوجد",
                    ConditionRelatedIndicators = "لا يوجد",
                    HowTheCaseMonitoredDone = "شرح",
                    DidStudentHaveSurgery = false,
                    DidHeTakesMedication = false,
                    DidHeTakesHealthVaccinations = false,
                    ChildReceivedAllTheRequiredVaccinations = false,
                    FromSpecialNeeds = false,
                    IsThereAnyoneInTheFamilyWithSpecialNeeds = false,
                    HaveChaildAttendedKindergartenBefore = false,
                    PersonalImageID = null,
                    BirthCertificateImageID = null,
                    ParentIdentifyImageID = null,
                    StudentPersonImageID = null,
                    UserID = null,
                    phoneNumber = "05992821",
                    isCheck = false,
                },
                new ChildCard()
                {
                    ID = IDs.ChildCard.Card2,
                    BirthOfDate = "2017/5/12",
                    CardFillDate = DateTime.Now,
                    NumberOfBrothers = 2,
                    NumberOfSisters = 2,
                    ChildArrangement = 3,
                    NumberOfSpicailNeeds = 1,
                    KindergartenName = "روضة نور الإيمان الخاصة",
                    StudentName = "علي",
                    FatherName = "جمال",
                    GrandFatherName = "خليل",
                    FamilyName = "محمد",
                    BirthPlace = "السموع",
                    Nationality = "فلسطيني",
                    Religion = "مسلم",
                    Address = "السموع-رافات-الدير",
                    FatherProfession = "عامل",
                    FatherWorkPhone = "05922423801",
                    FatherWorkPlace = "الخليل",
                    MotherWorkPhone = "059922358",
                    MotherWorkPlace = "Not working",
                    FatherEducationLevel = "باكالوريوس",
                    MotherEducationLevel = "None",
                    EmergencyPhoneNumber = "None",
                    childLivesWith = "الوالدين",
                    ParentsSituation = "متوسط",
                    DiseasesOfTheChild = "لا يوجد",
                    TheAuthoritySupervisingDisability = "لا يوجد",
                    ExtraInfo = "لا يوجد",
                    GurdianName = "خليل عواودة",
                    TeacherName = "راما رواشدة",
                    ManegerName = "هنا عواودة",
                    TheTypeOfConditionTheChildIsFacing = "لا يوجد",
                    ConditionDescription = "الوصف",
                    ConditionReasons = "لا يوجد",
                    ConditionRelatedIndicators = "لا يوجد",
                    HowTheCaseMonitoredDone = "شرح",
                    DidStudentHaveSurgery = false,
                    DidHeTakesMedication = false,
                    DidHeTakesHealthVaccinations = false,
                    ChildReceivedAllTheRequiredVaccinations = false,
                    FromSpecialNeeds = false,
                    IsThereAnyoneInTheFamilyWithSpecialNeeds = false,
                    HaveChaildAttendedKindergartenBefore = false,
                    PersonalImageID = null,
                    BirthCertificateImageID = null,
                    ParentIdentifyImageID = null,
                    StudentPersonImageID = null,
                    UserID = null,
                    phoneNumber = "095872223",
                    isCheck = null,
                }
            };
        }
    }
}
