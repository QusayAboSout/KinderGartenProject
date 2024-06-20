using Domain.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.SortablePagination
{
    public class SortableDto
    {
        public string? SortField { get; set; }
        public string? SortOrder { get; set; }
    }
}
