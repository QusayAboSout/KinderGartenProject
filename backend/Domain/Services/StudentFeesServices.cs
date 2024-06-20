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
    public class StudentFeesServices : GeneralServices<StudentFees>, IStudentFeesServices
    {
        IRepository<StudentFees> _repository;
        IMapper _mapper;
        
        public StudentFeesServices(IRepository<StudentFees> repository,IMapper mapper) : base(repository,mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<List<StudentFeesDto>> GetStudentFeesPerClass<StudentFeesDto>(long? classID)
        {
            var query = await _repository.Get().Where(e => e.ClassID == classID).ToListAsync();

            return _mapper.Map<List<StudentFeesDto>>(query);
        }

        public async Task<StudentFeesDto> GetStudentFees(long? studentID, long? classID)
        {
            var qeury = await _repository.Get().Where(e => e.ClassID == classID).Where(e => e.StudentID == studentID).FirstOrDefaultAsync();
            return _mapper.Map<StudentFeesDto>(qeury);
        }

        public async Task<List<StudentFeesDto>> UpdateStudentsFees(List<StudentFeesDto> studentFees)
        {
            var result = _mapper.Map<List<StudentFees>>(studentFees);
            result =  await _repository.UpdateRange(result);
            return _mapper.Map<List<StudentFeesDto>>(result);
        }
    }
}
