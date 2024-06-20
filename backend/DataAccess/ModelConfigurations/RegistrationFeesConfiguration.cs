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
    public class RegistrationFeesConfiguration
    {
        public RegistrationFeesConfiguration(EntityTypeBuilder<RegistrationFees> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<RegistrationFees> CreateData()
        {
            return new List<RegistrationFees>
            {
                new RegistrationFees
                {
                    BusAmount = 50,
                    CreateDate = DateTime.Now,
                    FeesAmount = 200,
                    Level = null,
                    Year = 2024,
                },
            };
        }
    }
}
