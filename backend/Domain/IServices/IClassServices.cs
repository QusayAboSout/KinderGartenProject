using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;
using WebApi.DTOs;

namespace Domain.IServices
{
    [ScopedService]
    public interface IClassServices : IGeneralService<Class>
    {
        Task<ClassDto?> GetTeacherClass(long userID);
    }
}
