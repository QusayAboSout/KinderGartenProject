using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class StudentLevelDto : BaseDto
    {
        public long StudentID { get; set; }
        public long LevelID { get; set; }
    }
}
