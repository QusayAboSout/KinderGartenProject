using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class StudentFeesConfiguration
    {
        public StudentFeesConfiguration(EntityTypeBuilder<StudentFees> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(e => e.student).WithMany().OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<StudentFees> CreateData()
        {
            return new List<StudentFees>
            {
                new StudentFees
                {
                    ID = IDs.StudentFees.StdFees,
                    FeesAmount = 200,
                    FeesDate = new DateOnly(2024,5,8),
                    WithBus = false,
                    StudentID = IDs.Student.Quasy,
                    ClassID = IDs.Class.ClassB,
                },
            };
        }
    }
}
