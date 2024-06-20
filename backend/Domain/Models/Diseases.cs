using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class Diseases : BaseEntity
    {
        public string DiseaseName { get; set; } = string.Empty;
        public string Note { get; set; } = string.Empty;
        public long DiseaseLevel { get; set; }

        public long StudentID { get; set; }
        public Student Student { get; set; }

    }
}
