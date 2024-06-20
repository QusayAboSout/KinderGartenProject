using AutoMapper;
using Domain.DTOs;
using Domain.Interfaces;
using Domain.IServices;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class GeneralEvaluationServices : GeneralServices<GeneralEvaluation>, IGeneralEvaluationServices
    {
        IRepository<GeneralEvaluation> _repository;
        IRepository<ClassSubjects> _subjectRepo;
        IMapper _mapper;
        
        
        public GeneralEvaluationServices(IRepository<GeneralEvaluation> repository,IMapper mapper,IRepository<ClassSubjects> classSubject) : base(repository,mapper)
        {
            _repository = repository;
            _mapper = mapper;
            _subjectRepo = classSubject;
        }

        public async Task<List<GeneralEvaluationDto>> GetStudentFinalMarks(long? classID, long? studentID)
        {
            var allSubjects = await _subjectRepo.Get().Where(e=>e.ClassID == classID).Include(e=>e.Subject).Select(e=>e.Subject).ToListAsync();


            var evaluations = await _repository.Get().Where(e => e.ClassID == classID).Where(e => e.StudentID == studentID).Include(e=>e.Subject)
                .ToListAsync();

            var result = new List<GeneralEvaluationDto>();
            foreach (var item in allSubjects)
            {
                var evaluation = evaluations.Where(e => e.SubjectID == item.ID).FirstOrDefault();
                if(evaluation is not null)
                {
                    result.Add(_mapper.Map<GeneralEvaluationDto>(evaluation));
                }
                else
                {
                    var newEvaluation = new GeneralEvaluationDto()
                    {
                        ID = 0,
                        SubjectID = item.ID,
                        ClassID = classID,
                        StudentID = studentID,
                        Grade = "بدون تقييم",
                        Subject = _mapper.Map<SubjectDto>(item),
                    };
                    result.Add(newEvaluation);
                }
            }

            return result;
        }

        public async Task<GeneralEvaluationDto> GetSubjectGrade(long studetnID, long classID, long subjectID)
        {
            var result = await _repository.Get().Where(e => e.StudentID == studetnID).Where(e => e.ClassID == classID)
                .Where(e => e.SubjectID == subjectID).FirstOrDefaultAsync();

            if(result == null)
            {
                /*                GeneralEvaluationDto generalEvaluation = new GeneralEvaluationDto()
                                {
                                    Grade = "بدون تقييم",
                                    StudentID = studetnID,
                                    ClassID = classID,
                                    SubjectID = subjectID,
                                };
                                await _services.Add(generalEvaluation);
                */
                result = new GeneralEvaluation()
                {
                    StudentID = studetnID,
                    ClassID = classID,
                    SubjectID = subjectID,
                    Grade = "بدون تقييم",
                };

            }
            return _mapper.Map<GeneralEvaluationDto>(result);
        }

        public async Task<List<GeneralEvaluationDto>> UpdateStudentFinalMarks(List<GeneralEvaluationDto> finalMarks)
        {
            var updateMarks = _mapper.Map<List<GeneralEvaluation>>(finalMarks);
            updateMarks = await _repository.UpdateRange(updateMarks);
            return _mapper.Map<List<GeneralEvaluationDto>>(updateMarks);
        }
    }
}
