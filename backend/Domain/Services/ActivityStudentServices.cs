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
    public class ActivityStudentServices : GeneralServices<ActivityStudent>, IActivityStudentServices
    {
        IRepository<ActivityStudent> _repository;
        IMapper _mapper;
        
        public ActivityStudentServices(IRepository<ActivityStudent> repository,IMapper mapper) : base(repository,mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
    }
}
