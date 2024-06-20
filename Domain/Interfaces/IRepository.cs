using System.Linq.Expressions;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.Interfaces
{
    [ScopedService]
    public interface IRepository<E>
    {
        Task<List<E>> GetAll();
        Task<E> GetById(long id);

        Task<E> Add(E q);
        Task<E> Update(E q);
        Task<List<E>> UpdateRange(List<E> q);
        Task<E> Delete(E q);

        Task<int> SaveChangeAsync();
        IQueryable<E> Get(Expression<Func<E, bool>> expression = null);

    }
}
