using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class StudentDto : BaseDto
    {
        public string StudentName { get; set; } = string.Empty;
        public string StudentLocation { get; set; } = string.Empty;
        public long? BirthCertificateImageID { get; set; } = null;
        public long? ParentCertificateImageID { get; set; } = null;
        public long? PersonalImageID { get; set; } = null;

        public string? ParentPhoneNumber { get; set; }

        public long? ClassID { get; set; }
        public long? UserID { get; set; }
        // public long? GuardianID { get; set; }
        public long? GeneralEvaluationID { get; set; }
        public long? ProgressEvaluationID { get; set; }
        public long? AttendanceID { get; set; }
        public long? ChildCardID { get; set; }
    }
}
