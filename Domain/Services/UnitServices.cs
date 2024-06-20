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
    public class UnitServices : GeneralServices<Unit>, IUnitServices
    {
        IRepository<Unit> _UnitRepository;
        IMapper _mapper;
        
        public UnitServices(IRepository<Unit> repository,IMapper mapper) : base(repository,mapper)
        {
            _UnitRepository = repository;
            _mapper = mapper;
        }

      public async  Task<List<UnitDto>> GetAllUnitForSubject<UnitDto> (long subjectID)
        {
           var allUnit = await _UnitRepository.Get().Where(e => e.SubjectID == subjectID).ToListAsync();
           return _mapper.Map<List<UnitDto>>(allUnit);
        }
    }
}
