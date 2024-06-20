using Domain.Models.SortablePagination;
using Domain.Models.SortablePaginationSearch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    public interface IGeneralService<E>
    {
        Task<PaginationResult<M>> GetAllWithPagention<M>(SortablePagentionDto sortablePagentionDto = null);

        Task<List<M>> GetAll<M>();
        Task<M> GetItem<M>(long id);
        
        Task<M> Add<M>(M Item);
        Task<M> Update<M>(M Item);
        Task<bool> Delete(long id);
    }
}
