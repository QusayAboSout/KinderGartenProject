using Domain.DTOs.User;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class PostsDto : BaseDto
    {
        public string? Discription { get; set; }
        public DateTime? PostDate { get; set; }

        public long? UserID { get; set; }
    }
    public class PostsViewDto : BaseDto
    {
        public string? Discription { get; set; }
        public DateTime? PostDate { get; set; }

        public long? UserID { get; set; }
        public UserDto? User { get; set; }
    }
}
