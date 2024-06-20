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
    public class GuardianTypeServices : GeneralServices<GuardianType>, IGuardianTypeServices
    {
        IRepository<GuardianType> _GuardianTypeRepository;
        IMapper _mapper;
        
        public GuardianTypeServices(IRepository<GuardianType> repository,IMapper mapper) : base(repository,mapper)
        {
            _GuardianTypeRepository = repository;
            _mapper = mapper;
        }
    }
}
