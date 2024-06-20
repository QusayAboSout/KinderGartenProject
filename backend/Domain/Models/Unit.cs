using Domain.Models.Base;

namespace Domain.Models
{
    public class Unit : BaseEntity
    {
        public string Name { get; set; } = string.Empty;

        public long? SubjectID { get; set; }
        public Subject Subject { get; set; }
        public List<ProgressEvaluation>? ProgressEvaluations { get; set; }
    }
}
