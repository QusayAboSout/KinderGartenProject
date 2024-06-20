using Domain.Models.Base;

namespace Domain.Models
{
    public class AttachmentActivityStudent : BaseEntity
    {
        public long? AttachementID { get; set; }
        public Attachment Attachment { get; set; }
        public long? ActivityStudentID { get; set; }
        public ActivityStudent ActivityStudent { get; set; }
    }
}
