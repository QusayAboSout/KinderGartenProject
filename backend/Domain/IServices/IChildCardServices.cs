using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.Services
{
    [ScopedService]
    public interface IChildCardServices : IGeneralService<ChildCard>
    {
        Task<List<ChildCardDto>> GetChildCardsByUser(ClaimsPrincipal user);
        Task<List<ChildCardDto>> GetChildCardsStatusByUser(ClaimsPrincipal user);
    }
}
