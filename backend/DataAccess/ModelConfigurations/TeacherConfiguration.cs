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
    public class TeacherConfiguration
    {
        public TeacherConfiguration(EntityTypeBuilder<Teacher> entityTypeBuilder)
        {
             entityTypeBuilder.HasData(CreateData());
        }

        private List<Teacher> CreateData()
        {
            return new List<Teacher>()
            {
                new Teacher()
                {
                    ID = IDs.Teacher.ArabicTeacher,
                    TeacherName = "تسنيم منصور",
                    PhoneNumber = "0596283683",
                    IdNumber = "3827378336",
                    SpeciallizationName = "اللغة العربية",
                    UserID = 2,
                },
/*                new Teacher()
                {
                    ID = IDs.Teacher.EnglishTeacher,
                    TeacherName = "رقية",
                    PhoneNumber = "05928297329",
                    IdNumber = "98392692633",
                    SpeciallizationName = "اللغة العربية",
                    UserID = null,
                },
                new Teacher()
                {
                    ID = IDs.Teacher.ArtTeacher,
                    TeacherName = "جودا",
                    PhoneNumber = "05927622",
                    IdNumber = "298282837",
                    SpeciallizationName = "فنون",
                    UserID = null,
                },
*/            };
        }
    }
}
