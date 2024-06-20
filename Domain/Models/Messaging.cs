using Domain.Models.Base;

namespace Domain.Models
{
    public class Messaging : BaseEntity
    {
        public bool Sender { get; set; }
        public DateTime Date { get; set; }
        public string? text { get; set; } = null;

        public long UserID { get; set; }
        public User User { get; set; }
        public long User2ID { get; set; }
        public User User2 { get; set; }
    }
}
