using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class GuardianDto : BaseDto
    {
        public long ID { get; set; }
        public string GurdianName { get; set; } = string.Empty;

        public long SectionID { get; set; }
        public long ContactNumbersID { get; set; }
        public long UserID { get; set; }
    }
}
