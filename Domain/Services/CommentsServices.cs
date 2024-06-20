using AutoMapper;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class CommentsServices : GeneralServices<Comments>, ICommentServices
    {
        IRepository<Comments> _CommentsRepository;
        IMapper _mapper;
        
        public CommentsServices(IRepository<Comments> repository,IMapper mapper) : base(repository,mapper)
        {
            _CommentsRepository = repository;
            _mapper = mapper;
        }
    }
}
