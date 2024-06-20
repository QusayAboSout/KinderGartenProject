using DataAccess.Constants;
using Domain.DTOs;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.ModelConfigurations
{
    public class ClassSubjectsConfiguration
    {
        public ClassSubjectsConfiguration(EntityTypeBuilder<ClassSubjects> entityTypeBuilder)
        {
            entityTypeBuilder.HasOne(e => e.Subject).WithMany(s => s.ClassSubjects).OnDelete(DeleteBehavior.NoAction);
            entityTypeBuilder.HasOne(e => e.Class).WithMany(s => s.ClassSubjects).OnDelete(DeleteBehavior.NoAction);
        }
    }
}
