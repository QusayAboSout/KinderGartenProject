using Domain.DTOs;
using Domain.Models.Base;
using WebApi.DTOs.Base;

namespace Domain.Models
{
    public class ClassSubjectsDto : BaseDto
    {
        public long? ClassID { get; set; }
        public long? SubjectID { get; set; }
    }

    public class ClassSubjectsViewDto : BaseDto
    {
        public long? ClassID { get; set; }
        public long? SubjectID { get; set; }
        public SubjectDto Subject { get; set; }
    }
}
