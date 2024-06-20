using Microsoft.EntityFrameworkCore;
using Domain.Interfaces;
using DataAccess.Data;
using System.Linq.Expressions;

namespace DataAccess.Repositories
{
    public class Repository<Q> : IRepository<Q> where Q : class
    {
        private readonly DataContext _context;
        public Repository(DataContext context)  
        {
            _context = context;
        }
        public async Task<List<Q>> GetAll()
        {
            return await _context.Set<Q>().ToListAsync();
        }
        public async Task<Q> GetById(long id)
        {
            var table = _context.Set<Q>();
            return await table.FindAsync(id);
        }
        public async Task<Q> Add(Q q)
        {
            var table = _context.Set<Q>();
            table.AddAsync(q);
            await _context.SaveChangesAsync();
            return q;
        }
        public async Task<Q> Update(Q q)
        {
            var table = _context.Set<Q>();
            table.Update(q);
           await _context.SaveChangesAsync();
            return q;
        }
        public async Task<List<Q>> UpdateRange(List<Q> q)
        {
            var table = _context.Set<Q>();
            table.UpdateRange(q);
           await _context.SaveChangesAsync();
            return q;
        }
        public async Task<Q> Delete(Q q)
        {
            var table = _context.Set<Q>(); // Git the table that contain the item you want to delete it
            table.Remove(q);
            await _context.SaveChangesAsync();
            return q;
        }

        public async Task<int> SaveChangeAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public IQueryable<Q> Get(Expression<Func<Q, bool>> expression = null)
        {
            var _table = _context.Set<Q>();
            if (expression == null)
                return _table.AsQueryable();
            return _table.Where(expression);
        }

    }
}
