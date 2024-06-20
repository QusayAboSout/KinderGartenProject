using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class SectionController : ControllerBase
    {
        ISectionServices _services;
        public SectionController(ISectionServices services)
        {
            _services = services;
        }

        [HttpGet("GetClassSections/{classID}")]
        public async Task<List<SectionDto>> GetClassSections(long classID)
        {
            return await _services.GetClassSections(classID);
        }

        [HttpGet("GetSectionById/{id}")]
        public async Task<SectionDto> GetSectionById(long id)
        {
            return await _services.GetItem<SectionDto>(id);
        }
        [HttpPost("AddSection")]
        public async Task<SectionDto> AddSection([FromBody] SectionDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateSection")]
        public async Task<SectionDto> UpdateSection([FromBody] SectionDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteSection/{id}")]
        public async Task<bool> DeleteSection(long id)
        {
            return await _services.Delete(id);
        }

    }
}
