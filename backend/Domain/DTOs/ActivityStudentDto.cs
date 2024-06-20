using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class ActivityStudentDto : BaseDto
    {
        public bool IsDone { get; set; }

        public long StudentID { get; set; }
        public long ActivityID { get; set; }
    }
}
