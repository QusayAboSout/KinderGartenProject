using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentLevelController : ControllerBase
    {
        IStudentLevelServices _services;
        public StudentLevelController(IStudentLevelServices services)
        {
            _services = services;
        }

        [HttpGet("GetStudentLevels")]
        public async Task<List<StudentLevelDto>> GetStudentLevels()
        {
            return await _services.GetAll<StudentLevelDto>();
        }

        [HttpGet("GetStudentLevelById/{id}")]
        public async Task<StudentLevelDto> GetStudentLevelById(long id)
        {
            return await _services.GetItem<StudentLevelDto>(id);
        }
        [HttpPost("AddStudentLevel")]
        public async Task<StudentLevelDto> AddStudentLevel([FromBody] StudentLevelDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateStudentLevel")]
        public async Task<StudentLevelDto> UpdateStudentLevel([FromBody] StudentLevelDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteStudentLevel/{id}")]
        public async Task<bool> DeleteStudentLevel(long id)
        {
            return await _services.Delete(id);
        }

    }
}
