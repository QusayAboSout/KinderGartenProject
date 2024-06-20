using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class ContactNumbersDto : BaseDto
    {
        public string ContactName { get; set; } = string.Empty;
        public string ContactNumber { get; set; } = string.Empty;

        public long GuardianID { get; set; }
        public long ChildCardID { get; set; }
    }
}
