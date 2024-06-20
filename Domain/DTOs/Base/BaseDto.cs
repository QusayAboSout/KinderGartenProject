using System.ComponentModel.DataAnnotations;

namespace WebApi.DTOs.Base
{
    public class BaseDto
    {
        [Key]
        public long ID { get; set; }
    }
}
