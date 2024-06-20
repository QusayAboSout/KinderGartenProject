using Domain.DTOs.User;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class TeacherDto : BaseDto
    {
        public string PhoneNumber { get; set; } = string.Empty;
        public string TeacherName { get; set; } = string.Empty;
        public string IdNumber { get; set; }
        public string SpeciallizationName { get; set; } = string.Empty;

        public long? UserID { get; set; }
        public UserDto? User { get; set; }

    }
/*    public class TeacherViewDto : BaseDto
    {
        public string PhoneNumber { get; set; } = string.Empty;
        public string TeacherName { get; set; } = string.Empty;
        public string IdNumber { get; set; }
        public string SpeciallizationName { get; set; } = string.Empty;

        public long? UserID { get; set; }
        public UserDto User { get; set; }
    }
*/}
