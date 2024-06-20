using Domain.Models.SortablePaginationSearch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Students
{
    public class StudentFillters : SortablePagentionSerchableDto
    {
        public long? classID { get; set; }
    }
}
