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
    public class ContactNumbersServices : GeneralServices<ContactNumbers>, IContactNumbersServices
    {
        IRepository<ContactNumbers> _ContactNumbersRepository;
        IMapper _mapper;
        
        public ContactNumbersServices(IRepository<ContactNumbers> repository,IMapper mapper) : base(repository,mapper)
        {
            _ContactNumbersRepository = repository;
            _mapper = mapper;
        }
    }
}
