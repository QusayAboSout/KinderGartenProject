using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttachmentActivityStudentController : ControllerBase
    {
        IAttachmentActivityStudentServices _services;
        public AttachmentActivityStudentController(IAttachmentActivityStudentServices services)
        {
            _services = services;
        }

        [HttpGet("GetAttachmentActivityStudents")]
        public async Task<List<AttachmentActivityStudentDto>> GetAttachmentActivityStudents()
        {
            return await _services.GetAll<AttachmentActivityStudentDto>();
        }

        [HttpGet("GetAttachmentActivityStudentById/{id}")]
        public async Task<AttachmentActivityStudentDto> GetAttachmentActivityStudentById(long id)
        {
            return await _services.GetItem<AttachmentActivityStudentDto>(id);
        }

        [HttpPost("AddAttachmentActivityStudent")]
        public async Task<AttachmentActivityStudentDto> AddAttachmentActivityStudent([FromBody] AttachmentActivityStudentDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateAttachmentActivityStudent")]
        public async Task<AttachmentActivityStudentDto> UpdateAttachmentActivityStudent([FromBody] AttachmentActivityStudentDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteAttachmentActivityStudent/{id}")]
        public async Task<bool> DeleteAttachmentActivityStudent(long id)
        {
            return await _services.Delete(id);
        }
    }
}
