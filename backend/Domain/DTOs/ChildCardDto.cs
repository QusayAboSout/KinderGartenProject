using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class ChildCardDto : BaseDto
    {
        public long ContactNumbersID { get; set; }

        public String? BirthOfDate { get; set; }
        public DateTime? CardFillDate { get; set; }

        public long? NumberOfBrothers { get; set; }
        public long? NumberOfSisters { get; set; }
        public long? ChildArrangement { get; set; }
        public long? NumberOfSpicialNeeds { get; set; }
        public long? UserID { get; set; }

        public string? KindergartenName { get; set; }
        public string? StudentName { get; set; }
        public string? FatherName { get; set; }
        public string? GrandFatherName { get; set; }
        public string? FamilyName { get; set; }
        public string? BirthPlace { get; set; }
        public string? Nationality { get; set; }
        public string? Religion { get; set; }
        public string? Address { get; set; }
        public string? FatherProfession { get; set; }
        public string? FatherWorkPhone { get; set; }
        public string? phoneNumber { get; set; }
        public string? FatherWorkPlace { get; set; }
        public string? MotherWorkPhone { get; set; }
        public string? MotherWorkPlace { get; set; }
        public string? FatherEducationLevel { get; set; }
        public string? MotherEducationLevel { get; set; }
        public string? EmergencyPhoneNumber { get; set; }
        public string? childLivesWith { get; set; }
        public string? ParentsSituation { get; set; }
        public string? DiseasesOfTheChild { get; set; }
        public string? TheAuthoritySupervisingDisability { get; set; }
        public string? ExtraInfo { get; set; }
        public string? GurdianName { get; set; }
        public string? TeacherName { get; set; }
        public string? ManegerName { get; set; }
        public string? TheTypeOfConditionTheChildIsFacing { get; set; }
        public string? ConditionDescription { get; set; }
        public string? ConditionReasons { get; set; }
        public string? ConditionRelatedIndicators { get; set; }
        public string? HowTheCaseMonitoredDone { get; set; }
        public string? RejectReason { get; set; }

        public bool? DidStudentHaveSurgery { get; set; }
        public bool? DidHeTakesMedication { get; set; }
        public bool? DidHeTakesHealthVaccinations { get; set; }
        public bool? ChildReceivedAllTheRequiredVaccinations { get; set; }
        public bool? FromSpecialNeeds { get; set; }
        public bool? IsThereAnyoneInTheFamilyWithSpecialNeeds { get; set; }
        public bool? HaveChaildAttendedKindergartenBefore { get; set; }
        public bool? isCheck { get; set; } = false;
        public bool? Status { get; set; }


        public long? PersonalImageID { get; set; }
        public long? BirthCertificateImageID { get; set; }
        public long? ParentIdentifyImageID { get; set; }
        public long? StudentPersonImageID { get; set; }
    }
}
