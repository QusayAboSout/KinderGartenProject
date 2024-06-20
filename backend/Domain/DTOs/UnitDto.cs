using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class UnitDto : BaseDto
    {
        public string Name { get; set; } = string.Empty;

        public long? SubjectID { get; set; }
    }
}
