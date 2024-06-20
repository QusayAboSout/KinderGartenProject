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
    public class AttachmentServices : GeneralServices<AttachmentServices>, IAttachmentServices
    {
        IRepository<AttachmentServices> _AttachmentServicesRepository;
        IMapper _mapper;
        
        public AttachmentServices(IRepository<AttachmentServices> repository,IMapper mapper) : base(repository,mapper)
        {
            _AttachmentServicesRepository = repository;
            _mapper = mapper;
        }
    }
}
