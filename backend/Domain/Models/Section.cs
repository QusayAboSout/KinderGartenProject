using Domain.Models.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.DTOs.Base;

namespace Domain.Models
{
    public class Section : BaseEntity
    {
        public String Name { get; set; }

        public long? ClassID { get; set; }
        public Class Class { get; set; }

    }
}
