using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class AttendanceDto : BaseDto
    {
        public bool IfExists { get; set; }
        public DateOnly Date { get; set; }

        public long ClassID { get; set; }
    }
}
