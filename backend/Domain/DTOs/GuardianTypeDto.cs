using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class GuardianTypeDto : BaseDto
    {
        public string Name { get; set; }

        public long GuardianID { get; set; }
    }
}
