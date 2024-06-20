using AutoMapper;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Domain.Models.SortablePagination;
using Domain.Models.SortablePaginationSearch;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class GeneralServices<E> : IGeneralService<E> where E : class
    {
        private readonly IRepository<E> _repo;
        IMapper _mapper;

        public GeneralServices(IRepository<E> repository,IMapper mapper)
        {
            _repo = repository;
            _mapper = mapper;
        }


        public virtual async Task<PaginationResult<M>> GetAllWithPagention<M>(SortablePagentionDto sortablePagentionDto = null)
        {
            var pagentionResult = new PaginationResult<M>();
            var query = _repo.Get();
            pagentionResult.Count = query.Count();
            query = GeneralMethods.ApplySortablePagnation(sortablePagentionDto, query);
            var result = await query.ToListAsync();
            pagentionResult.Data = _mapper.Map<List<M>>(result);

            return pagentionResult;
        }

        public async Task<M> Add<M>(M Item)
        {
            var add = _mapper.Map<E>(Item);
            await _repo.Add(add);
            return _mapper.Map<M>(add);
        }

        public async Task<bool> Delete(long id)
        {
            var ele = await _repo.GetById(id);
            if (ele is not null)
            {
                await _repo.Delete(ele);
            }
            return true;
        }

        public async Task<List<M>> GetAll<M>()
        {
            var data = await _repo.GetAll();
            return _mapper.Map<List<M>>(data);
        }

        public async Task<M> GetItem<M>(long id)
        {
            var item = await _repo.GetById(id);
            return _mapper.Map<M>(item);
        }

        public async Task<M> Update<M>(M Item)
        {
            var data = _mapper.Map<E>(Item);
            await _repo.Update(data);
            return _mapper.Map<M>(data);
        }
    }
}
