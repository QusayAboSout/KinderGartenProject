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
    public class UserConfiguration
    {
        public UserConfiguration(EntityTypeBuilder<User> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<User> CreateData()
        {
            return new List<User>
            {
                new User()
                {
                    ID = IDs.User.Admin,
                    UserName = "q201612@gmail.com",
                    Password = "google@1",
                    Name = "هنا عواودة",
                    Role = "admin",
                    Email = "q201612@gmail.com",
                    IsActive = true,
                },
                new User()
                {
                    ID = IDs.User.Teacher,
                    UserName = "qusay201612@gmail.com",
                    Password = "google@2",
                    Name = "تسنيم عواودة",
                    Role = "teacher",
                    Email = "qusay201612@gmail.com",
                    IsActive = true,
                    
                },
            };
        }
    }
}
