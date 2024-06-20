using Domain.Models;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class ProgressEvaluationDto : BaseDto
    {
        public string? Grade { get; set; }
        public DateOnly? Date { get; set; }

        public long? StudentID { get; set; }
        public long? SubjectID { get; set; }
        public long? UnitID { get; set; }
        public UnitDto? Unit { get; set; }
    }
}
