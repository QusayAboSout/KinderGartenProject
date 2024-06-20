using Domain.Models.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.DTOs.Base;

namespace Domain.DTOs
{
    public class SectionDto : BaseDto
    {
        public String Name { get; set; }
        public long? ClassID { get; set; }
    }
}
