using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttachmentController : ControllerBase
    {
        IAttachmentServices _services;
        public AttachmentController(IAttachmentServices services)
        {
            _services = services;
        }

        [HttpGet("GetAttachments")]
        public async Task<List<AttachmentDto>> GetAttachments()
        {
            return await _services.GetAll<AttachmentDto>();
        }

        [HttpGet("GetAttachmentById/{id}")]
        public async Task<AttachmentDto> GetAttachmentById(long id)
        {
            return await _services.GetItem<AttachmentDto>(id);
        }
        [HttpPost("AddAttachment")]
        public async Task<AttachmentDto> AddAttachment([FromBody] AttachmentDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateAttachment")]
        public async Task<AttachmentDto> UpdateAttachment([FromBody] AttachmentDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteAttachment/{id}")]
        public async Task<bool> DeleteAttachment(long id)
        {
            return await _services.Delete(id);
        }
    }
}
