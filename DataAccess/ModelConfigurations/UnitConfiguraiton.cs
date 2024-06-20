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
    public class UnitConfiguration
    {
        public UnitConfiguration(EntityTypeBuilder<Unit> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Unit> CreateData()
        {
            return new List<Unit>()
            {
                new Unit()
                {
                    ID = IDs.Unit.Unit1,
                    Name = "الارقام العشرية",
                    SubjectID = 1,
                },
                new Unit()
                {
                    ID = IDs.Unit.Unit2,
                    Name = "حرف الألف",
                    SubjectID = 2,
                },
                new Unit()
                {
                    ID = IDs.Unit.Unit3,
                    Name = "الأرقام",
                    SubjectID = 1,
                },
                new Unit()
                {
                    ID = IDs.Unit.Unit4,
                    Name = "حرف الباء",
                    SubjectID = 2,
                },
            };
        }
    }
}
