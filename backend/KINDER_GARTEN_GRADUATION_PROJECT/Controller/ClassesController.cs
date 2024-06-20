using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;
using WebApi.DTOs;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClassController : ControllerBase
    {
        IClassServices _services;
        public ClassController(IClassServices services)
        {
            _services = services;
        }

        [HttpGet("GetTeacherClass/{userID}")]
        public async Task<ClassDto?> GetTeacherClass(long userID)
        {
            return await _services.GetTeacherClass(userID);
        }
        [HttpGet("GetClasss")]
        public async Task<List<ClassDto>> GetClasss()
        {
            return await _services.GetAll<ClassDto>();
        }

        [HttpGet("GetClassById/{id}")]
        public async Task<ClassDto> GetClassById(long id)
        {
            return await _services.GetItem<ClassDto>(id);
        }
        [HttpPost("AddClass")]
        public async Task<ClassDto> AddClass([FromBody] ClassDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateClass")]
        public async Task<ClassDto> UpdateClass([FromBody] ClassDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteClass/{id}")]
        public async Task<bool> DeleteClass(long id)
        {
            return await _services.Delete(id);
        }

    }
}
