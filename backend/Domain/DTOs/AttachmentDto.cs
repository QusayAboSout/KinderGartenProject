using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class AttachmentDto : BaseDto
    {
        public string FileName { get; set; }
        public string Path { get; set; }
    }
}
