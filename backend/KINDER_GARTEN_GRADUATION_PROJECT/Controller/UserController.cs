using Domain.Constants;
using Domain.DTOs.User;
using Domain.IServices;
using Domain.Models;
using Domain.Models.UserModels;
using Domain.Services;
using JWT.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        IUserServices _services;
        public UserController(IUserServices services)
        {
            _services = services;
        }

        [HttpGet("GetUsers")]
        public async Task<List<UserDto>> GetUsers()
        {
            return await _services.GetAll<UserDto>();
        }

        [HttpGet("GetUserById/{id}")]
        public async Task<UserDto> GetUserById(long id)
        {
            return await _services.GetItem<UserDto>(id);
        }
        [HttpPost("AddUser")]
        public async Task<UserDto> AddUser([FromBody] UserDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateUser")]
        public async Task<UserDto> UpdateUser([FromBody] UserDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteUser/{id}")]
        public async Task<bool> DeleteUser(long id)
        {
            return await _services.Delete(id);
        }

        //////////////////////

        [HttpPut("ChangePassword")]
        public async Task<bool> ChangePassword([FromBody] ForceChangePasswordDto changePasswordDto)
        {
            return await _services.ForceChangePassword(changePasswordDto);
        }
    }
}
