using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActivityStudentController : ControllerBase
    {
        IActivityStudentServices _services;
        public ActivityStudentController(IActivityStudentServices services)
        {
            _services = services;
        }

        [HttpGet("GetActivityStudents")]
        public async Task<List<ActivityStudentDto>> GetActivityStudents()
        {
            return await _services.GetAll<ActivityStudentDto>();
        }

        [HttpGet("GetActivityStudentById/{id}")]
        public async Task<ActivityStudentDto> GetActivityStudentById(long id)
        {
            return await _services.GetItem<ActivityStudentDto>(id);
        }
        [HttpPost("AddActivityStudent")]
        public async Task<ActivityStudentDto> AddActivityStudent([FromBody] ActivityStudentDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateActivity")]
        public async Task<ActivityStudentDto> UpdateActivityStudent([FromBody] ActivityStudentDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteActivity/{id}")]
        public async Task<bool> DeleteActivityStudent(long id)
        {
            return await _services.Delete(id);
        }

    }
}
