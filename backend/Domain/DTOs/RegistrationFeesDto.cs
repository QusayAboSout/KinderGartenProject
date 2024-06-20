using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class RegistrationFeesDto : BaseDto
    {
        public long? FeesAmount { get; set; }
        public long? BusAmount { get; set; }
        public long? Level { get; set; }
        public long? Year { get; set; }
    }
}
