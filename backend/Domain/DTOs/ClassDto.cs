using WebApi.DTOs.Base;

namespace WebApi.DTOs
{
    public class ClassDto : BaseDto
    {
        public string ClassName { get; set; } = string.Empty;
        public long ClassYear { get; set; }
        public long? AttendanceID { get; set; }
        public long? TeacherID { get; set; }
    }
}
