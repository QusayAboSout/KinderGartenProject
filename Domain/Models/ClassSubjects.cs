using Domain.Models.Base;

namespace Domain.Models
{
    public class ClassSubjects : BaseEntity
    {
        public long? ClassID { get; set; }
        public Class Class { get; set; }
        public long? SubjectID { get; set; }
        public Subject Subject { get; set; }
    }
}
