using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class StudentFeesDto : BaseDto
    {
        public long? FeesAmount { get; set; }
        public DateOnly? FeesDate { get; set; }
        public bool? WithBus { get; set; }

        public long? StudentID { get; set; }
        public long? ClassID { get; set; }
    }
}
