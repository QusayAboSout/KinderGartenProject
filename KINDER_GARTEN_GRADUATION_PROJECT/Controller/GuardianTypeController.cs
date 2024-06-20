using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class GuardianTypeController : ControllerBase
    {
        IGuardianTypeServices _services;
        public GuardianTypeController(IGuardianTypeServices services)
        {
            _services = services;
        }

        [HttpGet("GetGuardianTypes")]
        public async Task<List<GuardianTypeDto>> GetGuardianTypes()
        {
            return await _services.GetAll<GuardianTypeDto>();
        }

        [HttpGet("GetGuardianTypeById/{id}")]
        public async Task<GuardianTypeDto> GetGuardianTypeById(long id)
        {
            return await _services.GetItem<GuardianTypeDto>(id);
        }
        [HttpPost("AddGuardianType")]
        public async Task<GuardianTypeDto> AddGuardianType([FromBody] GuardianTypeDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateGuardianType")]
        public async Task<GuardianTypeDto> UpdateGuardianType([FromBody] GuardianTypeDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteGuardianType/{id}")]
        public async Task<bool> DeleteGuardianType(long id)
        {
            return await _services.Delete(id);
        }

    }
}
