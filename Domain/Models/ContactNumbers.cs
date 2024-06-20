using Domain.Models.Base;

namespace Domain.Models
{
    public class ContactNumbers : BaseEntity
    {
        public string ContactName { get; set; } = string.Empty;
        public string ContactNumber { get; set; } = string.Empty;

        public long GuardianID { get; set; }
        public Guardian Guardian { get; set; }

        public long ChildCardID { get; set; }
        public ChildCard ChildCard { get; set; }
    }
}
