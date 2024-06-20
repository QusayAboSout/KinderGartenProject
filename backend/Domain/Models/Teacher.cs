using Domain.Models.Base;

namespace Domain.Models
{
    public class Teacher : BaseEntity
    {
        public string PhoneNumber { get; set; } = string.Empty;
        public string TeacherName { get; set; } = string.Empty;
        public string IdNumber { get; set; }
        public string SpeciallizationName { get; set; } = string.Empty;

        public long? UserID { get; set; }
        public User User { get; set; }

        public List<Experience> Experience { get; set; }
    }
}
