using Microsoft.EntityFrameworkCore;
using Domain.Models;

using DataAccess.ModelConfigurations;
using Domain.DTOs;
using Domain.Models.Students;
namespace DataAccess.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }

        public DbSet<Activity> Activities { get; set; } = null!;
        public DbSet<ActivityStudent> ActivityStudents { get; set; } = null !;
        public DbSet<Attachment> Attachments { get; set; } = null!;
        public DbSet<AttachmentActivityStudent> AttachmentActivityStudents { get; set; } = null!;
        public DbSet<Attendance> Attendances { get; set; } = null!;
        public DbSet<Class> Section { get; set; } = null!;
        public DbSet<Comments> Comments { get; set; } = null!;
        public DbSet<ContactNumbers> ContactNumbers { get; set; } = null!;
        public DbSet<Diseases> Diseases { get; set; } = null!;
        public DbSet<Experience> Experiences { get; set; } = null!;
        public DbSet<GeneralEvaluation> GeneralEvaluations { get; set; } = null!;
        public DbSet<Guardian> Guardians { get; set; } = null!;
        public DbSet<Section> GurdianTypes { get; set; } = null!;
        public DbSet<Hobbies> Hobbies { get; set; } = null!;
        public DbSet<Messaging> Messagings { get; set; } = null!;
        public DbSet<Posts> Postss { get; set; } = null!;
        public DbSet<ProgressEvaluation> ProgressEvaluations { get; set; } = null!;
        public DbSet<RegistrationFees> RegistrationFees { get; set; } = null!;
        public DbSet<Student> Students { get; set; } = null!;
        public DbSet<StudentFees> StudentFees { get; set; } = null!;
        public DbSet<StudentLevel> StudentLevels { get; set; } = null!;
        public DbSet<Subject> Subjects { get; set; } = null!;
        public DbSet<Teacher> Teachers { get; set; } = null!;
        public DbSet<Unit> Units { get; set; } = null!;
        public DbSet<User> Users { get; set; } = null!;
        public DbSet<ChildCard> ChildCards { get; set; }
        public DbSet<UserVerificationCode> UserVerificationCodes { get; set; }
        public DbSet<ClassSubjects> ClassSubjects { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //new ActivityConfiguration(modelBuilder.Entity<Activity>());
            //new ActivityStudentConfigration(modelBuilder.Entity<ActivityStudent>());
            //new AttachmentActivityStudentConfigration(modelBuilder.Entity<AttachmentActivityStudent>());
            //new StudentLevelConfigration(modelBuilder.Entity<StudentLevel>());
            new StudentConfiguration(modelBuilder.Entity<Student>());
            new StudentFeesConfiguration(modelBuilder.Entity<StudentFees>());
            new MessgingConfiguration(modelBuilder.Entity<Messaging>());
            new CommentConfiguration(modelBuilder.Entity<Comments>());
            new ClacessConfiguration(modelBuilder.Entity<Class>());
            new ChildCardConfiguration(modelBuilder.Entity<ChildCard>());
            new TeacherConfiguration(modelBuilder.Entity<Teacher>());
            new UserConfiguration(modelBuilder.Entity<User>());
            new PostConfiguration(modelBuilder.Entity<Posts>());
            new UnitConfiguration(modelBuilder.Entity<Unit>());
            new SubjectConfiguration(modelBuilder.Entity<Subject>());
            //new GuardianConfiguration(modelBuilder.Entity<Guardian>());
            //new AttachmentConfiguration(modelBuilder.Entity<Attachment>());
            //new AttendanceConfiguration(modelBuilder.Entity<Attendance>());
            new ProgressEvaluationConfiguration(modelBuilder.Entity<ProgressEvaluation>());
            new GeneralEvaluationConfiguration(modelBuilder.Entity<GeneralEvaluation>());
            //new ContactNumbersConfiguration(modelBuilder.Entity<ContactNumbers>());
            new ClassSubjectsConfiguration(modelBuilder.Entity<ClassSubjects>());
            new SectionConfigiuration(modelBuilder.Entity<Section>());

            base.OnModelCreating(modelBuilder);
        }
    }
}

