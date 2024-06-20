using Domain.DTOs;
using Domain.IServices;
using Domain.Models;
using Domain.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneralEvaluationController : ControllerBase
    {
        IGeneralEvaluationServices _services;
        public GeneralEvaluationController(IGeneralEvaluationServices services)
        {
            _services = services;
        }

        [HttpGet("GetGeneralEvaluations")]
        public async Task<List<GeneralEvaluationDto>> GetGeneralEvaluations()
        {
            return await _services.GetAll<GeneralEvaluationDto>();
        }

        [HttpGet("GetSubjectGrade")]
        public async Task<GeneralEvaluationDto> GetSubjectGrade([FromQuery] long studentID, [FromQuery] long classID, [FromQuery] long subjectID)
        {
            return await _services.GetSubjectGrade(studentID, classID, subjectID);
        }

        [HttpGet("GetGeneralEvaluationById/{id}")]
        public async Task<GeneralEvaluationDto> GetGeneralEvaluationById(long id)
        {
            return await _services.GetItem<GeneralEvaluationDto>(id);
        }

        [HttpGet("GetStudentFinalMarks")]
        public async Task<List<GeneralEvaluationDto>> GetStudentFinalMarks([FromQuery] long classID, [FromQuery] long studentID)
        {
            return await _services.GetStudentFinalMarks(classID,studentID);
        }

        [HttpPost("AddGeneralEvaluation")]
        public async Task<GeneralEvaluationDto> AddGeneralEvaluation([FromBody] GeneralEvaluationDto value)
        {
            return await _services.Add(value);
        }

        [HttpPut("UpdateStudentFinalMarks")]
        public async Task<List<GeneralEvaluationDto>> UpdateUnitsMarksForStudent(List<GeneralEvaluationDto> finalMarks)
        {
            return await _services.UpdateStudentFinalMarks(finalMarks);
        }
        [HttpPut("UpdateGeneralEvaluation")]
        public async Task<GeneralEvaluationDto> UpdateGeneralEvaluation([FromBody] GeneralEvaluationDto value)
        {
            return await _services.Update(value);
        }
        [HttpDelete("DeleteGeneralEvaluation/{id}")]
        public async Task<bool> DeleteGeneralEvaluation(long id)
        {
            return await _services.Delete(id);
        }
    }
}
