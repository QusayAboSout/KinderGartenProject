using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class DiseasesDto : BaseDto
    {
        public string DiseaseName { get; set; } = string.Empty;
        public string Note { get; set; } = string.Empty;
        public long DiseaseLevel { get; set; }

        public long StudentID { get; set; }
    }
}
