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
    public class ProgressEvaluationServices : GeneralServices<ProgressEvaluation>, IProgressEvaluationServices
    {
        IRepository<ProgressEvaluation> _repository;
        IRepository<Unit> _unitRepo;
        IMapper _mapper;

        public ProgressEvaluationServices(IRepository<ProgressEvaluation> repository, IMapper mapper, IRepository<Unit> unitRepo) : base(repository, mapper)
        {
            _repository = repository;
            _mapper = mapper;
            _unitRepo = unitRepo;
        }

        public async Task<List<ProgressEvaluationDto>> GetUnitsMarksForStudent(long? subjectID, long? studentID)
        {
            var units = await _unitRepo.Get().Where(e => e.SubjectID == subjectID).ToListAsync();

            var evaluations = await _repository.Get().Where(e=>e.SubjectID == subjectID).Where(e=>e.StudentID == studentID).Include(e=>e.Unit).ToListAsync();

            var result = new List<ProgressEvaluationDto>();
            foreach (var item in units)
            {
                var evaluation = evaluations.Where(e=> e.UnitID == item.ID).FirstOrDefault();
                if (evaluation != null)
                {
                    result.Add(_mapper.Map<ProgressEvaluationDto>(evaluation));
                }
                else
                {
                    var newEvaluation = new ProgressEvaluationDto()
                    {
                        ID = 0,
                        SubjectID = subjectID,
                        UnitID = item.ID,
                        Grade = "بدون تقييم",
                        StudentID = studentID,
                        Unit = _mapper.Map<UnitDto>(item),
                    };
                    result.Add(newEvaluation);
                }
            }

            return _mapper.Map<List<ProgressEvaluationDto>>(result);
        }

        public async Task<ProgressEvaluationDto> GetUnitsProgressEvaluationsForStudents(long unitID, long studentID)
        {
            var result = await _repository.Get().Where(e => e.UnitID == unitID).Where(e => e.StudentID == studentID)
                .FirstOrDefaultAsync();
            return _mapper.Map<ProgressEvaluationDto>(result);
        }

        public async Task<List<ProgressEvaluationDto>> UpdateUnitsMarksForStudent(List<ProgressEvaluationDto> unitsMarks)
        {
            var updateUnits = _mapper.Map<List<ProgressEvaluation>>(unitsMarks);
            updateUnits =  await _repository.UpdateRange(updateUnits);
            return _mapper.Map<List<ProgressEvaluationDto>>(updateUnits);
        }
    }
}
