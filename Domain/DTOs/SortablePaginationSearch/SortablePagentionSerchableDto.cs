using Domain.Models.SortablePagination;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.SortablePaginationSearch
{
    public class SortablePagentionSerchableDto: SortablePagentionDto
    {
        public string? SearchText { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }


    }
}
