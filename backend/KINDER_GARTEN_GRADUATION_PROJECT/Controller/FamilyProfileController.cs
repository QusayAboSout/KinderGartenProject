using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class FamilyProfileController : ControllerBase
    {
        IFamilyProfileServices _services;
        public FamilyProfileController(IFamilyProfileServices services)
        {
            _services = services;
        }

        [HttpGet("GetFamilyProfiles")]
        public async Task<List<FamilyProfileDto>> GetFamilyProfiles()
        {
            return await _services.GetAll<FamilyProfileDto>();
        }
        [HttpGet("GetFamilyProfilesByUser")]
        public async Task<FamilyProfileDto> GetFamilyProfilesByUser()
        {
            return await _services.GetUserFamilyProfile(User);
        }

        [HttpGet("GetFamilyProfileById/{id}")]
        public async Task<FamilyProfileDto> GetFamilyProfileById(long id)
        {
            return await _services.GetItem<FamilyProfileDto>(id);
        }

        [HttpPost("AddFamilyProfile")]
        public async Task<FamilyProfileDto> AddFamilyProfile([FromBody] FamilyProfileDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateFamilyProfile")]
        public async Task<FamilyProfileDto> UpdateFamilyProfile([FromBody] FamilyProfileDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteFamilyProfile/{id}")]
        public async Task<bool> DeleteFamilyProfile(long id)
        {
            return await _services.Delete(id);
        }
    }
}
