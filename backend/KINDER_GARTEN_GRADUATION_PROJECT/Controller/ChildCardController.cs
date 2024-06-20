using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChildCardController : ControllerBase
    {
        IChildCardServices _services;
        public ChildCardController(IChildCardServices services)
        {
            _services = services;
        }

        [HttpGet("GetChildCards")]
        public async Task<List<ChildCardDto>> GetChildCards()
        {
            return await _services.GetAll<ChildCardDto>();
        }
        [HttpGet("GetChildCardsByUser")]
        public async Task<List<ChildCardDto>> GetChildCardsByUser()
        {
            return await _services.GetChildCardsByUser(User);
        }
        [HttpGet("GetChildCardsStatusByUser")]
        public async Task<List<ChildCardDto>> GetChildCardsStatusByUser()
        {
            return await _services.GetChildCardsStatusByUser(User);
        }

        [HttpGet("GetChildCardById/{id}")]
        public async Task<ChildCardDto> GetChildCardById(long id)
        {
            return await _services.GetItem<ChildCardDto>(id);
        }

        [HttpPost("AddChildCard")]
        public async Task<ChildCardDto> AddChildCard([FromBody] ChildCardDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateChildCard")]
        public async Task<ChildCardDto> UpdateChildCard([FromBody] ChildCardDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteChildCard/{id}")]
        public async Task<bool> DeleteChildCard(long id)
        {
            return await _services.Delete(id);
        }
    }
}
