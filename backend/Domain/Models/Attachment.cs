using Domain.Models.Base;

namespace Domain.Models
{
    public class Attachment : BaseEntity
    {
        public string FileName { get; set; }
        public string Path { get; set; }

        public List<AttachmentActivityStudent> AttachmentActivityStudents { get; set; }
    }
}
