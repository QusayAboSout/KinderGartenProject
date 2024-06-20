using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class AttachmentActivityStudentDto : BaseDto
    {
        public long AttachementID { get; set; }
        public long ActivityStudentID { get; set; }
    }
}
