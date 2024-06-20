using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactNumbersController : ControllerBase
    {
        IContactNumbersServices _services;
        public ContactNumbersController(IContactNumbersServices services)
        {
            _services = services;
        }

        [HttpGet("GetContactNumberss")]
        public async Task<List<ContactNumbersDto>> GetContactNumberss()
        {
            return await _services.GetAll<ContactNumbersDto>();
        }

        [HttpGet("GetContactNumbersById/{id}")]
        public async Task<ContactNumbersDto> GetContactNumbersById(long id)
        {
            return await _services.GetItem<ContactNumbersDto>(id);
        }
        [HttpPost("AddContactNumbers")]
        public async Task<ContactNumbersDto> AddContactNumbers([FromBody] ContactNumbersDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateContactNumbers")]
        public async Task<ContactNumbersDto> UpdateContactNumbers([FromBody] ContactNumbersDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteContactNumbers/{id}")]
        public async Task<bool> DeleteContactNumbers(long id)
        {
            return await _services.Delete(id);
        }
    }
}
