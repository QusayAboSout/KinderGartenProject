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
    public class AttendanceConfiguration
    {
        public AttendanceConfiguration(EntityTypeBuilder<Attendance> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Attendance> CreateData()
        {
            return new List<Attendance>()
            {
                new Attendance()
                {
                    ID = IDs.Attendance.Attendance1,
                    IfExists = true,
                    Date = new DateOnly(2022,7,1),
                },
                new Attendance()
                {
                    ID = IDs.Attendance.Attendance2,
                    IfExists = false,
                    Date = new DateOnly(2022,7,1),
                },
            };
        }
    }
}
