using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        IPostServices _services;
        public PostController(IPostServices services)
        {
            _services = services;
        }

        [HttpGet("GetPosts")]
        public async Task<List<PostsViewDto>> GetPosts()
        {
            return await _services.GetAllPostsWithUser();
        }

        [HttpGet("GetPostById/{id}")]
        public async Task<PostsDto> GetPostById(long id)
        {
            return await _services.GetItem<PostsDto>(id);
        }
        [HttpPost("AddPost")]
        public async Task<PostsDto> AddPosts([FromBody] PostsDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdatePost")]
        public async Task<PostsDto> UpdatePosts([FromBody] PostsDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeletePost/{id}")]
        public async Task<bool> DeletePosts(long id)
        {
            return await _services.Delete(id);
        }

    }
}
