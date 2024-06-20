using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class ProgressEvaluation : BaseEntity
    {
        public string? Grade { get; set; }
        public DateOnly? Date { get; set; }

        public long? StudentID { get; set; }
        public Student? Students { get; set; }
        public long? UnitID { get; set; }
        public Unit? Unit { get; set; }
        public long? SubjectID { get; set; }
        public Subject? Subject { get; set; }
    }
}
