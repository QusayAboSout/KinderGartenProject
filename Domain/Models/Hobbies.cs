using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class Hobbies : BaseEntity
    {
        public string HobbiesName { get; set; } = string.Empty;

        public long StudentID { get; set; }
        public Student Student { get; set; }
    }
}
