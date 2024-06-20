using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class GeneralEvaluationDto : BaseDto
    {
        public string Grade { get; set; }

        public long? StudentID { get; set; }
        public long? ClassID { get; set; }
        public long? SubjectID { get; set; }
        public SubjectDto? Subject { get; set; }
    }
}
