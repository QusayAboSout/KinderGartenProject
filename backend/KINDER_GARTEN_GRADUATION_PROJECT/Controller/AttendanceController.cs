using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        IAttendanceServices _services;
        public AttendanceController(IAttendanceServices services)
        {
            _services = services;
        }

        [HttpGet("GetAttendances")]
        public async Task<List<AttendanceDto>> GetAttendances()
        {
            return await _services.GetAll<AttendanceDto>();
        }

        [HttpGet("GetAttendanceByClassID/{classID}")]
        public async Task<List<AttendanceDto>> GetAttendanceById(long? classID)
        {
            return await _services.GetStudentsAttendancesByClassID<AttendanceDto>(classID);
        }
        [HttpPost("AddAttendance")]
        public async Task<AttendanceDto> AddAttendance([FromBody] AttendanceDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateAttendance")]
        public async Task<AttendanceDto> UpdateAttendance([FromBody] AttendanceDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteAttendance/{id}")]
        public async Task<bool> DeleteAttendance(long id)
        {
            return await _services.Delete(id);
        }
    }
}
