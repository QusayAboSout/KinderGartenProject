using AutoMapper;
using Domain.DTOs;
using Domain.DTOs.User;
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
    public class ChildCardServices : GeneralServices<ChildCard>, IChildCardServices
    {
        IRepository<ChildCard> _ChildCardRepository;
        IRepository<User> _userRepo;
        IMapper _mapper;

        public ChildCardServices(IRepository<ChildCard> repository, IMapper mapper, IRepository<User> userRepo) : base(repository, mapper)
        {
            _ChildCardRepository = repository;
            _mapper = mapper;
            _userRepo = userRepo;
        }

        public async Task<List<ChildCardDto>> GetChildCardsByUser(ClaimsPrincipal user)
        {
            var userID = GeneralMethods.GetUserID(user);

            var userInfo = await _userRepo.Get().Where(e => e.ID == userID).FirstOrDefaultAsync();

            if (userInfo.Role == "admin")
            {
                var result = await _ChildCardRepository.Get().Where(e => e.isCheck == false).ToListAsync();
                return _mapper.Map<List<ChildCardDto>>(result);
            }
            else
            {
                var result = await _ChildCardRepository.Get().Where(e => e.UserID == userID).Where(e => e.isCheck == false).ToListAsync();
                return _mapper.Map<List<ChildCardDto>>(result);
            }

        }
        public async Task<List<ChildCardDto>> GetChildCardsStatusByUser(ClaimsPrincipal user)
        {
            var userID = GeneralMethods.GetUserID(user);

            var userInfo = await _userRepo.Get().Where(e => e.ID == userID).FirstOrDefaultAsync();

            var result = await _ChildCardRepository.Get().Where(e => e.Status != null).Where(e=>e.UserID == userID).ToListAsync();
            return _mapper.Map<List<ChildCardDto>>(result);

        }
    }
}
