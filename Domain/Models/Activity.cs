using Domain.Models.Base;

namespace Domain.Models
{
    public class Activity : BaseEntity
    {
        public string ActivityName { get; set; } = string.Empty;
        public string Mark { get; set; } = string.Empty;
        public DateTime date { get; set; }

        public long ClassID { get; set; }
        public Class Class { get; set; }

        public List<ActivityStudent> ActivityStudents { get; set; }
    }
}
