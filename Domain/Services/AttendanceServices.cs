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

namespace Domain.Services
{
    public class AttendanceServices : GeneralServices<Attendance>, IAttendanceServices
    {
        IRepository<Attendance> _repository;
        IMapper _mapper;
        
        public AttendanceServices(IRepository<Attendance> repository,IMapper mapper) : base(repository,mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<List<AttendanceDto>> GetStudentsAttendancesByClassID<AttendanceDto>(long? classID)
        {
            var query = await _repository.Get().Where(e => e.ClassID == classID).ToListAsync();
            return _mapper.Map<List<AttendanceDto>>(query);
        }
    }
}
