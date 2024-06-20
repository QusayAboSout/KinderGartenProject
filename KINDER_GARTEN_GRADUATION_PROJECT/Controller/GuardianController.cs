using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class GuardianController : ControllerBase
    {
        IGuardianServices _services;
        public GuardianController(IGuardianServices services)
        {
            _services = services;
        }

        [HttpGet("GetGuardians")]
        public async Task<List<GuardianDto>> GetGuardians()
        {
            return await _services.GetAll<GuardianDto>();
        }

        [HttpGet("GetGuardianById/{id}")]
        public async Task<GuardianDto> GetGuardianById(long id)
        {
            return await _services.GetItem<GuardianDto>(id);
        }
        [HttpPost("AddGuardian")]
        public async Task<GuardianDto> AddGuardian([FromBody] GuardianDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateGuardian")]
        public async Task<GuardianDto> UpdateGuardian([FromBody] GuardianDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteGuardian/{id}")]
        public async Task<bool> DeleteGuardian(long id)
        {
            return await _services.Delete(id);
        }

    }
}
