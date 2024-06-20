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
    public class PostConfiguration
    {
        public PostConfiguration(EntityTypeBuilder<Posts> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Posts> CreateData()
        {
            return new List<Posts>()
            {
                new Posts()
                {
                    ID = IDs.Post.post,
                    Discription = "غدا سيكون موعد دفع الرسوم",
                    PostDate = DateTime.Now,
                    UserID = IDs.User.Admin,
                },
            };
        }
    }
}
