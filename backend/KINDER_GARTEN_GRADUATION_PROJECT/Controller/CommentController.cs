using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        ICommentServices _services;
        public CommentController(ICommentServices services)
        {
            _services = services;
        }

        [HttpGet("GetComments")]
        public async Task<List<CommentsDto>> GetComments()
        {
            return await _services.GetAll<CommentsDto>();
        }

        [HttpGet("GetCommentById/{id}")]
        public async Task<CommentsDto> GetCommentById(long id)
        {
            return await _services.GetItem<CommentsDto>(id);
        }
        [HttpPost("AddComment")]
        public async Task<CommentsDto> AddComment([FromBody] CommentsDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateComment")]
        public async Task<CommentsDto> UpdateComment([FromBody] CommentsDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteComment/{id}")]
        public async Task<bool> DeleteComment(long id)
        {
            return await _services.Delete(id);
        }

    }
}
