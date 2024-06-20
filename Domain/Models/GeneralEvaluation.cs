using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class GeneralEvaluation : BaseEntity
    {
        public string Grade { get; set; }

        public Student Students { get; set; }
        public long? StudentID { get; set; }
        public Class Class { get; set; }
        public long? ClassID { get; set; }
        public Subject Subject { get; set; }
        public long? SubjectID { get; set; }
    }
}
