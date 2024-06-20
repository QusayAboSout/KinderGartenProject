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
    public class ActivityServices : GeneralServices<Activity>, IActivityServices
    {
        IRepository<Activity> _repository;
        IMapper _mapper;
        
        public ActivityServices(IRepository<Activity> repository,IMapper mapper) : base(repository,mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
    }
}
