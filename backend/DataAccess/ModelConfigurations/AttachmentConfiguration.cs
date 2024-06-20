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
    public class AttachmentConfiguration
    {
        public AttachmentConfiguration(EntityTypeBuilder<Attachment> entityTypeBuilder)
        {
            entityTypeBuilder.HasData(CreateData());
        }

        private List<Attachment> CreateData()
        {
            return new List<Attachment>()
            {
                new Attachment()
                {
                    ID = IDs.Attachment.StudentAttachment.Personal.PersonalImage,
                    FileName = "img.txt",
                    Path = "C:\\Users\\q2016\\OneDrive\\Pictures\\My love\\1075237.jpg",
                },
                new Attachment()
                {
                    ID = IDs.Attachment.StudentAttachment.Personal.PersonalImage2,
                    FileName = "img.txt",
                    Path = "C:\\Users\\q2016\\OneDrive\\Pictures\\My love\\caf0e366ad1bab85ebc51161ce8397e6.jpg",
                },
            };
        }
    }
}
