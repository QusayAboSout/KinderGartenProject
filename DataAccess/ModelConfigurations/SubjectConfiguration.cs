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
    public class SubjectConfiguration
    {
        public SubjectConfiguration(EntityTypeBuilder<Subject> entityTypeBuilder)
        {
            entityTypeBuilder.HasMany(e => e.Units).WithOne(u => u.Subject).OnDelete(DeleteBehavior.Cascade);
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Subject> CreateData()
        {
            return new List<Subject>()
            {
                new Subject()
                {
                    ID = IDs.Subject.Arabic,
                    Name = "رياضيات براعم",
                },
                new Subject()
                {
                    ID = IDs.Subject.English,
                    Name = "عربي براعم",
                },
            };
        }
    }
}
