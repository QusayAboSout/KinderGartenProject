using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class FamilyProfileServices : GeneralServices<FamilyProfile>, IFamilyProfileServices
    {
        IRepository<FamilyProfile> _FamilyProfileRepository;
        IMapper _mapper;
        IRepository<User> _userRepo;
        
        public FamilyProfileServices(IRepository<FamilyProfile> repository,IMapper mapper,IRepository<User> user) : base(repository,mapper)
        {
            _FamilyProfileRepository = repository;
            _mapper = mapper;
            _userRepo = user;

        }

        public async Task<FamilyProfileDto> GetUserFamilyProfile(ClaimsPrincipal user)
        {
            var userID = GeneralMethods.GetUserID(user);
            var userInfo = await _userRepo.Get().Where(e => e.ID == userID).FirstOrDefaultAsync();
            var result = _FamilyProfileRepository.Get().Where(e => e.UserID == userID).FirstOrDefaultAsync();
            return _mapper.Map<FamilyProfileDto>(result);
        }
    }
}
