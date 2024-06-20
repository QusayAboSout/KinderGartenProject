using DataAccess.Constants;
using Domain.DTOs;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfigurations
{
    public class AttachmentActivityStudentConfigration
    {
        public AttachmentActivityStudentConfigration(EntityTypeBuilder<AttachmentActivityStudent> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(e => e.ActivityStudent).WithMany(s => s.AttachmentActivityStudents).OnDelete(DeleteBehavior.NoAction);
            entityTypeBuilder.HasOne(e => e.Attachment).WithMany(s => s.AttachmentActivityStudents).OnDelete(DeleteBehavior.NoAction);
            // entityTypeBuilder.HasData(CreateData());
        }
        
        private List<AttachmentActivityStudent> CreateData()
        {
            return new List<AttachmentActivityStudent>
            {
                new AttachmentActivityStudent
                {
                    ID = IDs.AttachmentActivityStudent.AttActivStd1,
                    AttachementID = IDs.Attachment.StudentAttachment.Personal.PersonalImage,
                    ActivityStudentID = IDs.ActivityStudent.ActivStd1,
                },
                new AttachmentActivityStudent
                {
                    ID = IDs.AttachmentActivityStudent.AttActivStd2,
                    AttachementID = IDs.Attachment.StudentAttachment.Personal.PersonalImage2,
                    ActivityStudentID = IDs.ActivityStudent.ActivStd2,
                }
            };
        }
    }
}
