using Domain.Models;
using Domain.Models.SortablePaginationSearch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IClassSubjectsServices : IGeneralService<ClassSubjects>
    {
        Task<List<T>> GetAllWithSearch<T>(long classID);
        Task<ClassSubjectsDto> GetClassSubjectsById(long id);
        Task<ClassSubjectsDto> UpdateClassSubjects(ClassSubjectsDto value);
    }
}
