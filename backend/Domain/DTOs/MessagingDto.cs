using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class MessagingDto : BaseDto
    {
        public bool Sender { get; set; }
        public DateTime Date { get; set; }
        public string? text { get; set; } = null;

        public long UserID { get; set; }
        public long UserID2 { get; set; }
    }
}
