using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class Attendance : BaseEntity
    {
        public bool IfExists { get; set; }
        public DateOnly Date { get; set; }

        public long? ClassID { get; set; }

        public List<Student> Students { get; set; }
        public List<Class> Section { get; set; }
    }
}
