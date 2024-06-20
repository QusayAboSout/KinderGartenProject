using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class CommentsDto : BaseDto
    {
        public string? Comment { get; set; } = null;

        public long UserID { get; set; }
        public long PostID { get; set; }
    }
}
