using Domain.Models.Base;

namespace Domain.Models
{
    public class Level : BaseEntity
    {
        public string Name { get; set; } = string.Empty;
        public long FeesAmount { get; set; }

        public List<StudentLevel> StudentLevel { get; set; }
    }
}
