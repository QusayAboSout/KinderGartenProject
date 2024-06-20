using Domain.Models.Base;

namespace Domain.Models
{
    public class Experience : BaseEntity
    {
        public string ExperienceName { get; set; } = string.Empty;
        public long? NumberOfYears { get; set; }

        public long TeacherID { get; set; }
        public Teacher Teacher { get; set; }
    }
}
