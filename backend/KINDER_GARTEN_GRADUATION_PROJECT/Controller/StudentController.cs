using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Models.SortablePaginationSearch;
using Domain.Models.Students;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        IStudentServices _services;
        public StudentController(IStudentServices services)
        {
            _services = services;
        }

        [HttpGet("GetStudents")]
        public async Task<PaginationResult<StudentDto>> GetStudents ([FromQuery] StudentFillters studentFillters)
        {
            return await _services.GetAllWithSearch<StudentDto>(studentFillters);
        }

        [HttpGet("GetMyStudents/{userID}")]
        public async Task<List<StudentDto>> GetMyStudents(long userID)
        {
            return await _services.GetMyStudents(userID);
        }
        [HttpGet("GetClassStudents")]
        public async Task<List<StudentDto>> GetClassStudents()
        {
            return await _services.GetClassStudents(User);
        }
        [HttpGet("GetStudentById/{id}")]
        public async Task<StudentDto> GetStudentById(long id)
        {
            return await _services.GetItem<StudentDto>(id);
        }
        [HttpPost("AddStudent")]
        public async Task<StudentDto> AddStudent([FromBody] StudentDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateStudent")]
        public async Task<StudentDto> UpdateStudent([FromBody] StudentDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteStudent/{id}")]
        public async Task<bool> DeleteStudent(long id)
        {
            return await _services.Delete(id);
        }

    }
}
