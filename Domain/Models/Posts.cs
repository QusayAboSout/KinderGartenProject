using Domain.Models.Base;

namespace Domain.Models
{
    public class Posts : BaseEntity
    {
        public string? Discription { get; set; }
        public DateTime? PostDate { get; set; }

        public long? UserID { get; set; }
        public User? User { get; set; }

        public List<Comments>? Comments { get; set; }
    }
}
