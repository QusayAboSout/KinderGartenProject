using System.ComponentModel.DataAnnotations;

namespace Domain.Models.Base
{
    public class BaseEntity
    {
        [Key] public long ID { get; set; }
       public DateTime CreateDate { get; set; }

    }
}
