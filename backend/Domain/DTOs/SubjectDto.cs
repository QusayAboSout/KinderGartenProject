using Domain.Models;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class SubjectDto : BaseDto
    {
        public string Name { get; set; } = string.Empty;
    }
    public class SubjectWithUnit : BaseDto
    {
        public string Name { get; set; } = string.Empty;
        public List<UnitDto> Units { get; set; }
    }
}
