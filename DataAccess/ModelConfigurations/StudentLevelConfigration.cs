using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfigurations
{
    public class StudentLevelConfigration
    {
        public StudentLevelConfigration(EntityTypeBuilder<StudentLevel> entityTypeBuilder)
        {
            //entityTypeBuilder.HasOne(e => e.Level).WithMany(s => s.StudentLevel).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasOne(e => e.Student).WithMany(s => s.StudentLevel).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<StudentLevel> CreateData()
        {
            return new List<StudentLevel>
            {
                new StudentLevel
                {
                    ID = IDs.StudentLevel.stdLevel,
                    StudentID = IDs.Student.Amisea,
                    LevelID = null,
                },
                new StudentLevel
                {
                    ID = IDs.StudentLevel.stdLevel2,
                    StudentID = IDs.Student.Quasy,
                    LevelID = null,
                },
            };
        }
    }
}
