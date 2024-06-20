using DataAccess.Constants;
using Domain.DTOs;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfigurations
{
    public class ActivityStudentConfigration
    {
        public ActivityStudentConfigration(EntityTypeBuilder<ActivityStudent> entityTypeBuilder)
        {
            // entityTypeBuilder.HasOne(e => e.Activity).WithMany(s => s.ActivityStudents).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasOne(e => e.Student).WithMany(s => s.ActivityStudents).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<ActivityStudent> CreateData()
        {
            return new List<ActivityStudent>
            {
                new ActivityStudent
                {
                    ID = IDs.ActivityStudent.ActivStd1,
                    IsDone = true,
                    StudentID = IDs.Student.Quasy,
                    ActivityID = IDs.Activity.Activity1,
                },
                new ActivityStudent
                {
                    ID = IDs.ActivityStudent.ActivStd2,
                    IsDone = false,
                    StudentID = IDs.Student.Amisea,
                    ActivityID = IDs.Activity.Activity2,
                }
            };
        }
    }
}
