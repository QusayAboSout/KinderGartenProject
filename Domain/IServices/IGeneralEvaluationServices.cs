using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.Services
{
    [ScopedService]
    public interface IGeneralEvaluationServices : IGeneralService<GeneralEvaluation>
    {
        Task<GeneralEvaluationDto> GetSubjectGrade(long studetnID,long classID,long subjectID);
        Task<List<GeneralEvaluationDto>> GetStudentFinalMarks(long? classID,long? studentID);
        Task<List<GeneralEvaluationDto>> UpdateStudentFinalMarks(List<GeneralEvaluationDto> finalMarks);
    }
}
