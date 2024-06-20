using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagingController : ControllerBase
    {
        IMessagingServices _services;
        public MessagingController(IMessagingServices services)
        {
            _services = services;
        }

        [HttpGet("GetMessgings")]
        public async Task<List<MessagingDto>> GetMessgings()
        {
            return await _services.GetAll<MessagingDto>();
        }

        [HttpGet("GetMessgingById/{id}")]
        public async Task<MessagingDto> GetMessgingById(long id)
        {
            return await _services.GetItem<MessagingDto>(id);
        }
        [HttpPost("AddMessaging")]
        public async Task<MessagingDto> AddMessaging([FromBody] MessagingDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateMessaging")]
        public async Task<MessagingDto> UpdateMessaging([FromBody] MessagingDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteMessaging/{id}")]
        public async Task<bool> DeleteMessaging(long id)
        {
            return await _services.Delete(id);
        }

    }
}
