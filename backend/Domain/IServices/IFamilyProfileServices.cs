using Domain.DTOs;
using Domain.Models;
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
    public interface IFamilyProfileServices : IGeneralService<FamilyProfile>
    {
        Task<FamilyProfileDto> GetUserFamilyProfile(ClaimsPrincipal user);
    }
}
