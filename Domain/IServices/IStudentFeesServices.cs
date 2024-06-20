using Domain.DTOs;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IStudentFeesServices : IGeneralService<StudentFees>
    {
        Task<List<StudentFeesDto>> GetStudentFeesPerClass<StudentFeesDto>(long? classID);
        Task<StudentFeesDto> GetStudentFees(long? studentID, long? classID);
        Task<List<StudentFeesDto>> UpdateStudentsFees(List<StudentFeesDto> studentFees);
    }
}
