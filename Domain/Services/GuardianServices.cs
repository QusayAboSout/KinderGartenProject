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
    public class GuardianServices : GeneralServices<Guardian>, IGuardianServices
    {
        IRepository<Guardian> _GuardianRepository;
        IMapper _mapper;
        
        public GuardianServices(IRepository<Guardian> repository,IMapper mapper) : base(repository,mapper)
        {
            _GuardianRepository = repository;
            _mapper = mapper;
        }
    }
}
