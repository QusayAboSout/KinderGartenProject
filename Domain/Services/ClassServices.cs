using AutoMapper;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.DTOs;

namespace Domain.Services
{
    public class ClassServices : GeneralServices<Class>, IClassServices
    {
        IRepository<Class> _classRepository;
        IRepository<Teacher> _teacherRepo;
        IMapper _mapper;
        
        public ClassServices(IRepository<Class> repository,IRepository<Teacher> teacherRepo,IMapper mapper) : base(repository,mapper)
        {
            _classRepository = repository;
            _mapper = mapper;
            _teacherRepo = teacherRepo;
        }

        public async Task<ClassDto?> GetTeacherClass(long userID)
        {
            var teacher = await _teacherRepo.Get().Where(e=>e.UserID == userID).FirstOrDefaultAsync();
            var clas = await _classRepository.Get().Where(e=>e.TeacherID == teacher.ID).FirstOrDefaultAsync();
            if(clas is not null)
            {
            return _mapper.Map<ClassDto>(clas);
            }
            else
            {
                ClassDto classDto = new ClassDto();
                return classDto;
            }
        }
    }
}
