using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class ProgressEvaluationConfiguration
    {
        public ProgressEvaluationConfiguration(EntityTypeBuilder<ProgressEvaluation> entityTypeBuilder)
        {
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<ProgressEvaluation> CreateData()
        {
            return new List<ProgressEvaluation>()
            {
                new ProgressEvaluation()
                {
                    ID = IDs.ProgressEvaluation.Good,
                    Grade = "جيد",
                    Date = new DateOnly(2024,5,1),
                },
                new ProgressEvaluation()
                {
                    ID = IDs.ProgressEvaluation.TooBad,
                    Grade = "سيئ جدا",
                    Date = new DateOnly(2024,5,1),
                },
            };
        }
    }
}
