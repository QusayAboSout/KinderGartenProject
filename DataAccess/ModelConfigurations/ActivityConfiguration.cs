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
    public class ActivityConfiguration
    {
        public ActivityConfiguration(EntityTypeBuilder<Activity> entityTypeBuilder)
        {
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<Activity> CreateData()
        {
            return new List<Activity>()
            {
                new Activity()
                {
                    ID = IDs.Activity.Activity1,
                    ActivityName = "فصل الشتاء",
                    Mark = "جيد",
                    date = DateTime.Now,
                    ClassID = IDs.Class.ClassB,
                },
                new Activity()
                {
                    ID = IDs.Activity.Activity2,
                    ActivityName = "فصل الصيف",
                    Mark = "ممتاز",
                    date = DateTime.Now,
                    ClassID = IDs.Class.ClassA,
                },
            };
        }
    }
}
