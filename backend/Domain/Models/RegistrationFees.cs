using Domain.Models.Base;

namespace Domain.Models
{
    public class RegistrationFees : BaseEntity
    {
        public long? FeesAmount { get; set; }
        public long? BusAmount { get; set; }
        public long? Level { get; set; }
        public long? Year { get; set; }
    }
}
