using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.SortablePagination
{
    public class PagentionDto
    {
        public int? SkipCount { get; set; }
        public int? MaxResultCount { get; set; }
    }
}
