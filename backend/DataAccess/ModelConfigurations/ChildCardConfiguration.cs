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
                    ChildArrangement = 2,
                    KindergartenName = "روضة نور الإيمان الخاصة",
                    StudentName = "محمد",
                    BirthPlace = "يطا",
                    Nationality = "فلسطيني",
                    Religion = "مسلم",
                    childLivesWith = "الوالدين",
                    DiseasesOfTheChild = "لا يوجد",
                    TheAuthoritySupervisingDisability = "لا يوجد",
                    ExtraInfo = "لا يوجد",
                    GurdianName = "إبراهيم عواودة",
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
                    HaveChaildAttendedKindergartenBefore = false,
                    PersonalImageID = null,
                    BirthCertificateImageID = null,
                    StudentPersonImageID = null,
                    UserID = null,
                    isCheck = false,
                },
                new ChildCard()
                {
                    ID = IDs.ChildCard.Card2,
                    BirthOfDate = "2017/5/12",
                    CardFillDate = DateTime.Now,
                    ChildArrangement = 3,
                    KindergartenName = "روضة نور الإيمان الخاصة",
                    StudentName = "علي",
                    BirthPlace = "السموع",
                    Nationality = "فلسطيني",
                    Religion = "مسلم",
                    childLivesWith = "الوالدين",
                    DiseasesOfTheChild = "لا يوجد",
                    TheAuthoritySupervisingDisability = "لا يوجد",
                    ExtraInfo = "لا يوجد",
                    GurdianName = "خليل عواودة",
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
                    HaveChaildAttendedKindergartenBefore = false,
                    PersonalImageID = null,
                    BirthCertificateImageID = null,
                    StudentPersonImageID = null,
                    UserID = null,
                    isCheck = null,
                }
            };
        }
    }
}
