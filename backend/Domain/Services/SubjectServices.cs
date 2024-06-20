using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class SubjectServices : GeneralServices<Subject>, ISubjectServices
    {
        IRepository<Subject> _SubjectRepository;
        IMapper _mapper;
        
        public SubjectServices(IRepository<Subject> repository,IMapper mapper) : base(repository,mapper)
        {
            _SubjectRepository = repository;
            _mapper = mapper;
        }

        public async Task<SubjectWithUnit> GetSubjectWithUnit(long id)
        {
            var res = await _SubjectRepository.Get().Where(e=>e.ID == id).Include(e=>e.Units).FirstOrDefaultAsync();
            return _mapper.Map<SubjectWithUnit>(res);
        }
    }
}
