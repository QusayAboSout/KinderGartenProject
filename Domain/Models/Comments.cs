using Domain.Models.Base;

namespace Domain.Models
{
    public class Comments : BaseEntity
    {
        public string? Comment { get; set; } = null;

        public long UserID { get; set; }
        public User User { get; set; }
        public long PostID { get; set; }
        public Posts Post { get; set; }

    }
}
