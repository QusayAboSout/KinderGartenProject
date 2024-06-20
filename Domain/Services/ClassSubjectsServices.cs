using AutoMapper;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Domain.Models.SortablePaginationSearch;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class ClassSubjectsServices : GeneralServices<ClassSubjects>, IClassSubjectsServices
    {
        IRepository<ClassSubjects> _ClassRepository;
        IMapper _mapper;
        
        public ClassSubjectsServices(IRepository<ClassSubjects> repository,IMapper mapper) : base(repository,mapper)
        {
            _ClassRepository = repository;
            _mapper = mapper;
        }

        public async Task<List<T>> GetAllWithSearch<T>(long classID)
        {
            var resutl = await _ClassRepository.Get(e => e.ClassID == classID).Include(x => x.Subject).ToListAsync();
            return _mapper.Map<List<T>>(resutl);
        }

        public Task<ClassSubjectsDto> GetClassSubjectsById(long id)
        {
            throw new NotImplementedException();
        }

        public Task<ClassSubjectsDto> UpdateClassSubjects(ClassSubjectsDto value)
        {
            throw new NotImplementedException();
        }
    }
}
