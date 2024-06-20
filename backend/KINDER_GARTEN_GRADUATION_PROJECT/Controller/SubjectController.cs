using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubjectController : ControllerBase
    {
        ISubjectServices _services;
        public SubjectController(ISubjectServices services)
        {
            _services = services;
        }

        [HttpGet("GetSubjects")]
        public async Task<List<SubjectDto>> GetSubjects()
        {
            return await _services.GetAll<SubjectDto>();
        }

        [HttpGet("GetSubjectWithUnitById/{id}")]
        public async Task<SubjectWithUnit> GetSubjectById(long id)
        {
            return await _services.GetSubjectWithUnit(id);
        }
        [HttpPost("AddSubject")]
        public async Task<SubjectDto> AddSubject([FromBody] SubjectDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateSubject")]
        public async Task<SubjectDto> UpdateSubject([FromBody] SubjectDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteSubject/{id}")]
        public async Task<bool> DeleteSubject(long id)
        {
            return await _services.Delete(id);
        }
    }
}
