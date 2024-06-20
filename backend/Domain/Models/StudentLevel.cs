using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class StudentLevel : BaseEntity
    {
        public long? StudentID { get; set; }
        public Student Student { get; set; }
        public long? LevelID { get; set; }
        public Level Level { get; set; }
    }
}
