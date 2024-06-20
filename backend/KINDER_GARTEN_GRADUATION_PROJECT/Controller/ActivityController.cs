using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActivityController : ControllerBase
    {
        IActivityServices _services;
        public ActivityController(IActivityServices services)
        {
            _services = services;
        }

        [HttpGet("GetActivitys")]
        public async Task<List<ActivityDto>> GetActivitys()
        {
            return await _services.GetAll<ActivityDto>();
        }

        [HttpGet("GetActivityById/{id}")]
        public async Task<ActivityDto> GetActivityById(long id)
        {
            return await _services.GetItem<ActivityDto>(id);
        }
        [HttpPost("AddActivity")]
        public async Task<ActivityDto> AddActivity([FromBody] ActivityDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateActivity")]
        public async Task<ActivityDto> UpdateActivity([FromBody] ActivityDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteActivity/{id}")]
        public async Task<bool> DeleteActivity(long id)
        {
            return await _services.Delete(id);
        }
    }
}
