using Domain.Models.Base;

namespace Domain.Models
{
    public class User : BaseEntity
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string? Role { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public string? GoogleAccessToken { get; internal set; }
    }
}
