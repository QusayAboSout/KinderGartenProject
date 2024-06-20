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
    public class GeneralEvaluationConfiguration
    {
        public GeneralEvaluationConfiguration(EntityTypeBuilder<GeneralEvaluation> entityTypeBuilder)
        {
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<GeneralEvaluation> CreateData()
        {
            return new List<GeneralEvaluation>()
            {
                new GeneralEvaluation()
                {
                    ID = IDs.GeneralEvaluation.Good,
                    Grade = "جيد",
                    ClassID = IDs.Class.ClassB,
                },
                new GeneralEvaluation()
                {
                    ID = IDs.GeneralEvaluation.Bad,
                    Grade = "سيئ",
                    ClassID = IDs.Class.ClassA
                },
            };
        }
    }
}
