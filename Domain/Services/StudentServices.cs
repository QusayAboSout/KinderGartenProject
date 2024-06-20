using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Domain.Models.SortablePaginationSearch;
using Domain.Models.Students;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class StudentServices : GeneralServices<Student>, IStudentServices
    {
        IRepository<Student> _studentRepository;
        IRepository<User> _userRepo;
        IRepository<Teacher> _teacherRepo;
        IRepository<Class> _classRepo;
        IMapper _mapper;
        
        public StudentServices(IRepository<Student> repository,IRepository<Class> classRepo,IRepository<Teacher> teacherRepo,IRepository<User> userRepo,IMapper mapper) : base(repository,mapper)
        {
            _studentRepository = repository;
            _mapper = mapper;
            _userRepo = userRepo;
            _teacherRepo = teacherRepo;
            _classRepo = classRepo;
        }

        public async Task<PaginationResult<T>> GetAllWithSearch<T>(StudentFillters studentFillters)
        {
            var pagentionResult = new PaginationResult<T>();
            var query = _studentRepository.Get()
                .AsQueryable();
            query = ApplayFilter(query, studentFillters);
            pagentionResult.Count = query.Count();
            query = GeneralMethods.ApplySortablePagnationDateFilter(studentFillters, query);
            var result = await query.ToListAsync();
            pagentionResult.Data = _mapper.Map<List<T>>(result);
            return pagentionResult;
        }

        public async Task<List<StudentDto>> GetClassStudents(ClaimsPrincipal user)
        {
            var userID = GeneralMethods.GetUserID(user);

            var teacher = await _teacherRepo.Get().Where(e=>e.UserID == userID).FirstOrDefaultAsync();
            var clas = await _classRepo.Get().Where(e => e.TeacherID == teacher.ID).FirstOrDefaultAsync();
            if(clas != null)
            {
            var students = await _studentRepository.Get().Where(e => e.ClassID == clas.ID).ToListAsync();
            return _mapper.Map<List<StudentDto>>(students);
            }
            else
            {
                List<StudentDto> studentDtos = new List<StudentDto>();
                return studentDtos;
            }
        }

        public async Task<List<StudentDto>> GetMyStudents(long userID)
        {
            var result = await _studentRepository.Get().Where(e=>e.userID == userID).ToListAsync();
            return _mapper.Map<List<StudentDto>>(result);
        }

        private IQueryable<Student> ApplayFilter(IQueryable<Student> query, StudentFillters studentFillters)
        {
            if(studentFillters.classID != null)
            {
                query = query.Where(s => s.ClassID == studentFillters.classID);
            }
            return query;
        }

    }
}
