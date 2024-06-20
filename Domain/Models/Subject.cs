using Domain.DTOs;
using Domain.Models.Base;

namespace Domain.Models
{
    public class Subject : BaseEntity
    {
        public string Name { get; set; } = string.Empty;

        public List<ClassSubjects> ClassSubjects { get; set; }
        public List<Unit> Units { get; set; }
        public List<GeneralEvaluation> GeneralEvaluations { get; set; }
    }
}
