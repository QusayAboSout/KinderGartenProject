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
    public class MessagingServices : GeneralServices<Messaging>, IMessagingServices
    {
        IRepository<Messaging> _MessagingRepository;
        IMapper _mapper;
        
        public MessagingServices(IRepository<Messaging> repository,IMapper mapper) : base(repository,mapper)
        {
            _MessagingRepository = repository;
            _mapper = mapper;
        }
    }
}
