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
    public class MessgingConfiguration
    {
        public MessgingConfiguration(EntityTypeBuilder<Messaging> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(s => s.User).WithMany().OnDelete(DeleteBehavior.NoAction);
            entityTypeBuilder.HasOne(s => s.User2).WithMany().OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<Messaging> CreateData()
        {
            return new List<Messaging>()
            {
                new Messaging()
                {
                    ID = IDs.Messaging.msg1,
                    Sender = true,
                    Date = DateTime.Now,
                    text = "From Admin to Family",
                    UserID = IDs.User.Admin,
                    User2ID = IDs.User.Student,
                },
                new Messaging()
                {
                    ID = IDs.Messaging.msg2,
                    Sender = true,
                    Date = DateTime.Now,
                    text = "From Sub Admin to Family",
                    UserID = IDs.User.Teacher,
                    User2ID = IDs.User.Student,
                },
            };
        }
    }
}
