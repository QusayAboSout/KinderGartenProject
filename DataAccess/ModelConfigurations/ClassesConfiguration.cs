using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class ClacessConfiguration
    {
        public ClacessConfiguration(EntityTypeBuilder<Class> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(c => c.Teacher).WithOne().OnDelete(DeleteBehavior.NoAction);
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Class> CreateData()
        {
            return new List<Class>
            {
                new Class
                {
                    ID = IDs.Class.ClassA,
                    ClassName = "براعم",
                    ClassYear = DateTime.Now.Year,
                    GeneralEvaluationID = null,
                    AttendanceID = null,
                    TeacherID = null,
                },
                new Class
                {
                    ID = IDs.Class.ClassB,
                    ClassName = "بستان",
                    ClassYear = DateTime.Now.Year,
                    GeneralEvaluationID = null,
                    AttendanceID = null,
                    TeacherID = null,
                },
            };
        }
    }
}
