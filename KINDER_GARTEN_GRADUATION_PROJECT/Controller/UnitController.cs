using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class UnitController : ControllerBase
    {
        IUnitServices _services;
        public UnitController(IUnitServices services)
        {
            _services = services;
        }

        [HttpGet("GetUnits")]
        public async Task<List<UnitDto>> GetUnits()
        {
            return await _services.GetAll<UnitDto>();
        }
        [HttpGet("GetUnitsSubject/{subjectID}")]
        public async Task<List<UnitDto>> GetUnitsSubject(long subjectID)
        {
            return await _services.GetAllUnitForSubject<UnitDto>(subjectID);
        }

        [HttpGet("GetUnitById/{id}")]
        public async Task<UnitDto> GetUnitById(long id)
        {
            return await _services.GetItem<UnitDto>(id);
        }
        [HttpPost("AddUnit")]
        public async Task<UnitDto> AddUnit([FromBody] UnitDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateUnit")]
        public async Task<UnitDto> UpdateUnit([FromBody] UnitDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteUnit/{id}")]
        public async Task<bool> DeleteUnit(long id)
        {
            return await _services.Delete(id);
        }

    }
}
