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
    public class PostServices : GeneralServices<Posts>, IPostServices
    {
        IRepository<Posts> _PostsRepository;
        IMapper _mapper;
        
        public PostServices(IRepository<Posts> repository,IMapper mapper) : base(repository,mapper)
        {
            _PostsRepository = repository;
            _mapper = mapper;
        }

        public async Task<List<PostsViewDto>> GetAllPostsWithUser()
        {
            var result = await _PostsRepository.Get().Include(e=>e.User).ToListAsync();
            return _mapper.Map<List<PostsViewDto>>(result);
        }
    }
}
