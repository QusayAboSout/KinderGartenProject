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
    public class UserVerificationCodeConfiguration
    {
        public UserVerificationCodeConfiguration(EntityTypeBuilder<Activity> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Activity> CreateData()
        {
            return new List<Activity>()
            {
            };
        }
    }
}
