using Domain.Models.Base;

namespace Domain.Models
{
    public class Guardian : BaseEntity
    {
        public string GurdianName { get; set; } = string.Empty;

        public long GuardianTypeID { get; set; }
        public GuardianType GurdianType { get; set; }
        public long UserID { get; set; }
        public User User { get; set; }
    }
}
