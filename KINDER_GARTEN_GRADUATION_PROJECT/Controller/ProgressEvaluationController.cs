using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProgressEvaluationController : ControllerBase
    {
        IProgressEvaluationServices _services;
        public ProgressEvaluationController(IProgressEvaluationServices services)
        {
            _services = services;
        }

        [HttpGet("GetProgressEvaluations")]
        public async Task<List<ProgressEvaluationDto>> GetProgressEvaluations()
        {
            return await _services.GetAll<ProgressEvaluationDto>();
        }

        [HttpGet("GetUnitsProgressEvaluationsForStudents")]
        public async Task<ProgressEvaluationDto> GetUnitsProgressEvaluationsForStudents([FromQuery] long unitID, [FromQuery] long studentID)
        {
            return await _services.GetUnitsProgressEvaluationsForStudents(unitID,studentID);
        }

        [HttpGet("GetUnitsMarksForStudent")]
        public async Task<List<ProgressEvaluationDto>> GetUnitsMarksForStudent([FromQuery] long subjectID, [FromQuery] long studentID)
        {
            return await _services.GetUnitsMarksForStudent(subjectID,studentID);
        }
        [HttpPut("UpdateUnitsMarksForStudent")]
        public async Task<List<ProgressEvaluationDto>> UpdateUnitsMarksForStudent(List<ProgressEvaluationDto> unitsMarks)
        {
            return await _services.UpdateUnitsMarksForStudent(unitsMarks);
        }

        [HttpGet("GetProgressEvaluationById/{id}")]
        public async Task<ProgressEvaluationDto> GetProgressEvaluationById(long id)
        {
            return await _services.GetItem<ProgressEvaluationDto>(id);
        }
        [HttpPost("AddProgressEvaluation")]
        public async Task<ProgressEvaluationDto> AddProgressEvaluation([FromBody] ProgressEvaluationDto value)
        {
            return await _services.Add(value);
        }
        [HttpPut("UpdateProgressEvaluation")]
        public async Task<ProgressEvaluationDto> UpdateProgressEvaluation([FromBody] ProgressEvaluationDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteProgressEvaluation/{id}")]
        public async Task<bool> DeleteProgressEvaluation(long id)
        {
            return await _services.Delete(id);
        }
    }
}
