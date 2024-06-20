using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentFeesController : ControllerBase
    {
        IStudentFeesServices _services;
        public StudentFeesController(IStudentFeesServices services)
        {
            _services = services;
        }

        [HttpGet("GetStudentFeess")]
        public async Task<List<StudentFeesDto>> GetStudentFeess()
        {
            return await _services.GetAll<StudentFeesDto>();
        }
        [HttpGet("GetStudentFeesPerClass/{classID}")]
        public async Task<List<StudentFeesDto>> GetStudentFeess(long? classID)
        {
            return await _services.GetStudentFeesPerClass<StudentFeesDto>(classID);
        }
        [HttpGet("GetStudentFees")]
        public async Task<StudentFeesDto> GetStudentFeess([FromQuery] long? classID, [FromQuery] long? studentID)
        {
            return await _services.GetStudentFees(studentID, classID);
        }

        [HttpPost("AddStudentFees")]
        public async Task<StudentFeesDto> AddStudentFees([FromBody] StudentFeesDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateStudentsFees")]
        public async Task<List<StudentFeesDto>> UpdateStudentFees(List<StudentFeesDto> studentsFees)
        {
            return await _services.UpdateStudentsFees(studentsFees);
        }
        [HttpDelete("DeleteStudentFees/{id}")]
        public async Task<bool> DeleteStudentFees(long id)
        {
            return await _services.Delete(id);
        }

    }
}
