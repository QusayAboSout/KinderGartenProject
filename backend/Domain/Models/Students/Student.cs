using Domain.DTOs;
using Domain.Models.Base;

namespace Domain.Models.Students
{
    public class Student : BaseEntity
    {
        public string StudentName { get; set; } = string.Empty;
        public string StudentLocation { get; set; } = string.Empty;

        public Attachment? BirthCertificateImage { get; set; } = null;
        public long? BirthCertificateImageID { get; set; } = null;
        public Attachment? ParentCertificateImage { get; set; } = null;
        public long? ParentCertificateImageID { get; set; } = null;
        public Attachment? PersonalImage { get; set; } = null;
        public long? PersonalImageID { get; set; } = null;

        public string? ParentPhoneNumber { get; set; }

        public long? ClassID { get; set; }
        public Class Class { get; set; }
        public long? userID { get; set; }
        public User? User { get; set; }

         public long? GuardianID { get; set; }
        // public Guardian Guardian { get; set; }

        public long? GeneralEvaluationID { get; set; }
        public long? AttendanceID { get; set; }
        public Attendance Attendance { get; set; }
        public long? ChildCardID { get; set; }
        public ChildCard ChildCard { get; set; }

        public List<StudentLevel> StudentLevel { get; set; }
        public List<ActivityStudent> ActivityStudents { get; set; }
        public List<Diseases> Diseases { get; set; }
        public List<Hobbies> Hobbies { get; set; }
        public List<ProgressEvaluation> ProgressEvaluations { get; set; }
        public List<GeneralEvaluation> GeneralEvaluations { get; set; }
    }
}
