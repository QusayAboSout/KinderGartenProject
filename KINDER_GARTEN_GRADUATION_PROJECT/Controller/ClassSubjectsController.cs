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
    public class ClassSubjectsController : ControllerBase
    {
        IClassSubjectsServices _services;
        public ClassSubjectsController(IClassSubjectsServices services)
        {
            _services = services;
        }

        [HttpGet("GetClassSubjects")]
        public async Task<List<ClassSubjectsViewDto>> GetClassSubjectss(long classID)
        {
            return await _services.GetAllWithSearch<ClassSubjectsViewDto>(classID);
        }

        [HttpGet("GetClassSubjectsById/{id}")]
        public async Task<ClassSubjectsDto> GetClassSubjectsById(long id)
        {
            return await _services.GetItem<ClassSubjectsDto>(id);
        }
        [HttpPost("AddClassSubjects")]
        public async Task<ClassSubjectsDto> AddClassSubjects([FromBody] ClassSubjectsDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateClassSubjects")]
        public async Task<ClassSubjectsDto> UpdateClassSubjects([FromBody] ClassSubjectsDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteClassSubjects/{id}")]
        public async Task<bool> DeleteClassSubjects(long id)
        {
            return await _services.Delete(id);
        }

    }
}
