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
    public interface IProgressEvaluationServices : IGeneralService<ProgressEvaluation>
    {
        Task<ProgressEvaluationDto> GetUnitsProgressEvaluationsForStudents(long unitID,long studentID);
        Task<List<ProgressEvaluationDto>> GetUnitsMarksForStudent(long? subjectID,long? studentID);
        Task<List<ProgressEvaluationDto>> UpdateUnitsMarksForStudent(List<ProgressEvaluationDto> unitsMarks);
    }
}
