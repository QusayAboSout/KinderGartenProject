using AutoMapper;
using Domain.DTOs;
using Domain.DTOs.User;
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
    public class TeacherServices : GeneralServices<Teacher>, ITeacherServices
    {
        IRepository<Teacher> _TeacherRepository;
        IMapper _mapper;
        
        public TeacherServices(IRepository<Teacher> repository,IMapper mapper) : base(repository,mapper)
        {
            _TeacherRepository = repository;
            _mapper = mapper;
        }

        public async Task<List<TeacherDto>> GetAllTeachers()
        {
            var result = await _TeacherRepository.Get().Include(e => e.User).ToListAsync();
            return _mapper.Map<List<TeacherDto>>(result);
        }
    }
}
