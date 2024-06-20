using DataAccess.Constants;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ModelConfigurations
{
    public class SectionConfigiuration
    {
        public SectionConfigiuration(EntityTypeBuilder<Section> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(e=>e.Class).WithMany(e=>e.Sections);
            entityTypeBuilder.HasData(CreateData());
        }
        private List<Section> CreateData()
        {
            return new List<Section>
            {
                new Section
                {
                    ID = IDs.Section.SectionA,
                    Name = "شعبة أ",
                    ClassID = IDs.Class.ClassA,
                },
                new Section
                {
                    ID = IDs.Section.SectionB,
                    Name = "شعبة ب",
                    ClassID= IDs.Class.ClassA,
                },
                new Section
                {
                    ID = IDs.Section.SectionC,
                    Name = "شعبة أ",
                    ClassID= IDs.Class.ClassB,
                },
                new Section
                {
                    ID = IDs.Section.SectionD,
                    Name = "شعبة ج",
                    ClassID= IDs.Class.ClassB,
                },
            };
        }
    }
}
