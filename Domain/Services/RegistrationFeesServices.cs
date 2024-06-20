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
    public class RegistrationFeesServices : GeneralServices<RegistrationFees>, IRegistrationFeesServices
    {
        IRepository<RegistrationFees> _RegistrationFeesRepository;
        IMapper _mapper;
        
        public RegistrationFeesServices(IRepository<RegistrationFees> repository,IMapper mapper) : base(repository,mapper)
        {
            _RegistrationFeesRepository = repository;
            _mapper = mapper;
        }
    }
}
