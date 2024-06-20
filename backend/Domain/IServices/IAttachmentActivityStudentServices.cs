using AutoMapper;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.Services
{
    [ScopedService]
    public interface IAttachmentActivityStudentServices : IGeneralService<AttachmentActivityStudent>
    {
    }
}
