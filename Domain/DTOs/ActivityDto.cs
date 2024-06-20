
using WebApi.DTOs.Base;

namespace Domain.DTOs;

public class ActivityDto : BaseDto
{
    public string ActivityName { get; set; } = string.Empty;
    public string Mark { get; set; } = string.Empty;
    public DateTime date { get; set; }

    public long ClassID { get; set; }
}
