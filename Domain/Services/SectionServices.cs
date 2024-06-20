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
    public class SectionServices : GeneralServices<Section>, ISectionServices
    {
        IRepository<Section> _SectionRepository;
        IRepository<Class> _ClassRepo;
        IMapper _mapper;
        
        public SectionServices(IRepository<Section> repository,IRepository<Class> classRepo,IMapper mapper) : base(repository,mapper)
        {
            _SectionRepository = repository;
            _mapper = mapper;
            _ClassRepo = classRepo;
        }

        public async Task<List<SectionDto>> GetClassSections(long classID)
        {
            var clas = await _ClassRepo.GetById(classID);
            var sections = await _SectionRepository.Get().Where(e=>e.ClassID == clas.ID).ToListAsync();
            return _mapper.Map<List<SectionDto>>(sections);
        }
    }
}
