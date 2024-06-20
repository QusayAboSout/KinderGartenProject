using Domain.DTOs;
using Domain.Models.SortablePaginationSearch;
using Domain.Models.Students;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IStudentServices : IGeneralService<Student>
    {
        Task<PaginationResult<T>> GetAllWithSearch<T>(StudentFillters studentFillters);
        Task<List<StudentDto>> GetMyStudents(long userID);
        Task<List<StudentDto>> GetClassStudents(ClaimsPrincipal user);
    }
}
