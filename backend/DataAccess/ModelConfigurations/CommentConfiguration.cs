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
    public class CommentConfiguration
    {
        public CommentConfiguration(EntityTypeBuilder<Comments> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(c => c.User).WithMany().OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }

        private List<Comments> CreateData()
        {
            return new List<Comments>()
            {
                new Comments()
                {
                    ID = IDs.Comments.comm1,
                    Comment = "تعليق رقم 1",
                    UserID = IDs.User.Student,
                    PostID = IDs.Post.post,
                },
                new Comments()
                {
                    ID = IDs.Comments.comm2,
                    Comment = "تعليق رقم 2",
                    UserID = IDs.User.Student,
                    PostID = IDs.Post.post,
                },
            };
        }
    }
}
