using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeacherController : ControllerBase
    {
        ITeacherServices _services;
        public TeacherController(ITeacherServices services)
        {
            _services = services;
        }

        [HttpGet("GetTeachers")]
        public async Task<List<TeacherDto>> GetTeachers()
        {
            return await _services.GetAllTeachers();
        }

        [HttpGet("GetTeacherById/{id}")]
        public async Task<TeacherDto> GetTeacherById(long id)
        {
            return await _services.GetItem<TeacherDto>(id);
        }
        [HttpPost("AddTeacher")]
        public async Task<TeacherDto> AddTeacher([FromBody] TeacherDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateTeacher")]
        public async Task<TeacherDto> UpdateTeacher([FromBody] TeacherDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteTeacher/{id}")]
        public async Task<bool> DeleteTeacher(long id)
        {
            return await _services.Delete(id);
        }

    }
}
