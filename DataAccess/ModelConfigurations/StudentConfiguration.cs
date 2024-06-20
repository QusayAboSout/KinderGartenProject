using DataAccess.Constants;
using Domain.Models.Students;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class StudentConfiguration
    {
        public StudentConfiguration(EntityTypeBuilder<Student> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(e => e.Class).WithMany(e => e.Students).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<Student> CreateData()
        {
            return new List<Student>()
            {
                new Student()
                {
                    ID = IDs.Student.Amisea,
                    StudentName = "Qusay",
                    StudentLocation = "Samou",
                    BirthCertificateImageID = null,
                    ParentCertificateImageID = null,
                    PersonalImageID = null,
                    ParentPhoneNumber = "0599544987",
                    ClassID = null,
                    userID = null,
                    GeneralEvaluationID = null,
                    ChildCardID = null,
                    AttendanceID = null,
                },
                new Student()
                {
                    ID = IDs.Student.Quasy,
                    StudentName = "Amisea",
                    StudentLocation = "Samuu",
                    BirthCertificateImageID = null,
                    ParentCertificateImageID = null,
                    PersonalImageID = null,
                    ParentPhoneNumber = "0589524887",
                    ClassID = null,
                    userID = null,
                    GeneralEvaluationID = null,
                    ChildCardID = null,
                    AttendanceID = null,
                }
            };
        }
    }
}
