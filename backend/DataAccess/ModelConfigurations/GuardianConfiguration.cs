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
    public class GuardianConfiguration
    {
        public GuardianConfiguration(EntityTypeBuilder<Guardian> entityTypeBuilder)
        {
           // entityTypeBuilder.HasData(CreateData());
        }

        private List<Guardian> CreateData()
        {
            return new List<Guardian>()
            {
                new Guardian()
                {
                    ID = IDs.Gurdian.father,
                    GurdianName = "Mohammad",
                    GuardianTypeID = IDs.GurdianType.parent,
                    UserID = IDs.User.Student,
                },
                new Guardian()
                {
                    ID = IDs.Gurdian.mother,
                    GurdianName = "Mariam",
                    GuardianTypeID= IDs.GurdianType.Aunt,
                    UserID = IDs.User.Student,
                    
                },
            };
        }
    }
}
