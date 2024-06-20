using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class ExperienceDto : BaseDto
    {
        public string ExperienceName { get; set; } = string.Empty;
        public long? NumberOfYears { get; set; }

        public long TeacherID { get; set; }
    }
}
