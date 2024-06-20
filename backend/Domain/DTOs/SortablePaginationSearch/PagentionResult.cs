using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.SortablePaginationSearch
{
    public class PaginationResult<T>
    {
        public List<T> Data { get; set; }
        public int Count { get; set; }
    }
}
