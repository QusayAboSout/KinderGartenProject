using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegistrationFeesController : ControllerBase
    {
        IRegistrationFeesServices _services;
        public RegistrationFeesController(IRegistrationFeesServices services)
        {
            _services = services;
        }

        [HttpGet("GetRegistrationFeess")]
        public async Task<List<RegistrationFeesDto>> GetRegistrationFeess()
        {
            return await _services.GetAll<RegistrationFeesDto>();
        }

        [HttpGet("GetRegistrationFeesById/{id}")]
        public async Task<RegistrationFeesDto> GetRegistrationFeesById(long id)
        {
            return await _services.GetItem<RegistrationFeesDto>(id);
        }
        [HttpPost("AddRegistrationFees")]
        public async Task<RegistrationFeesDto> AddRegistrationFees([FromBody] RegistrationFeesDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateRegistrationFees")]
        public async Task<RegistrationFeesDto> UpdateRegistrationFees([FromBody] RegistrationFeesDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteStudentFees/{id}")]
        public async Task<bool> DeleteRegistrationFees(long id)
        {
            return await _services.Delete(id);
        }

    }
}
