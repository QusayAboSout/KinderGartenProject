using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class LevelDto : BaseDto
    {
        public string Name { get; set; } = string.Empty;
        public long FeesAmount { get; set; }
    }
}
