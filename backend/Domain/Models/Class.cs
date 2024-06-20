using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class Class : BaseEntity
    {
        public string ClassName { get; set; } = string.Empty;
        public long ClassYear { get; set; }
        // public string Shoapa { get; set; }

        public long? GeneralEvaluationID { get; set; }
        public long? AttendanceID { get; set; }
        public Attendance Attendance { get; set; }
        public long? TeacherID { get; set; }
        public Teacher Teacher { get; set; }
        

        public List<Activity> Activities { get; set; }
        public List<StudentFees> StudentFees { get; set; }
        public List<Student> Students { get; set; }
        public List<Section> Sections { get; set; }
        public List<ClassSubjects> ClassSubjects { get; set; }
        public List<GeneralEvaluation> GeneralEvaluations { get; set; }
    }
}
