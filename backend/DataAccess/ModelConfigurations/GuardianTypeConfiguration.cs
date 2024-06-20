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
    public class GuardianTypeConfiguration
    {
        public GuardianTypeConfiguration(EntityTypeBuilder<GuardianType> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<GuardianType> CreateData()
        {
            return new List<GuardianType>()
            {
                new GuardianType()
                {
                    ID = IDs.GurdianType.Aunt,
                    Name = "Mariam",
                },
                new GuardianType()
                {
                    ID = IDs.GurdianType.parent,
                    Name = "Mohammad",
                },
            };
        }
    }
}
