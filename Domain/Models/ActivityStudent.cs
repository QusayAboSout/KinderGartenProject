using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class ActivityStudent : BaseEntity
    {
        public bool IsDone { get; set; }

        public long StudentID { get; set; }
        public Student Student { get; set; }
        public long ActivityID { get; set; }
        public Activity Activity { get; set; }

        public List<AttachmentActivityStudent> AttachmentActivityStudents { get; set; }
    }
}
