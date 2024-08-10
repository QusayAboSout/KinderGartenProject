using AutoMapper;
using Domain.Models;
using Domain.DTOs;
using WebApi.DTOs;
using System.Runtime.CompilerServices;
using Domain.DTOs.User;
using Domain.Models.UserVerificationCodeModel;
using Domain.Models.Students;

namespace WebApi.Mapper
{
    public static class AutoMapperProfile
    {
        public static IServiceCollection ConfigureMapper(this IServiceCollection services)
        {
            var config = new MapperConfiguration(cfg =>
            {

                cfg.CreateMap<Student, StudentDto>().ReverseMap();
                cfg.CreateMap<ChildCard, ChildCardDto>().ReverseMap();
                cfg.CreateMap<Activity, ActivityDto>().ReverseMap();
                cfg.CreateMap<ActivityStudent, ActivityStudentDto>().ReverseMap();
                cfg.CreateMap<AttachmentActivityStudent, AttachmentActivityStudentDto>().ReverseMap();
                cfg.CreateMap<Class, ClassDto>().ReverseMap();
                cfg.CreateMap<Comments, CommentsDto>().ReverseMap();
                cfg.CreateMap<Guardian, GuardianDto>().ReverseMap();
                cfg.CreateMap<Section, SectionDto>().ReverseMap();
                cfg.CreateMap<Messaging, MessagingDto>().ReverseMap();
                cfg.CreateMap<Posts, PostsDto>().ReverseMap();
                cfg.CreateMap<StudentFees, StudentFeesDto>().ReverseMap();
                cfg.CreateMap<StudentLevel, StudentLevelDto>().ReverseMap();
                cfg.CreateMap<Subject, SubjectDto>().ReverseMap();
                cfg.CreateMap<Teacher, TeacherDto>().ReverseMap();
                cfg.CreateMap<Unit, UnitDto>().ReverseMap();
                cfg.CreateMap<User, UserDto>().ReverseMap();
                cfg.CreateMap<ContactNumbers, ContactNumbersDto>().ReverseMap();
                cfg.CreateMap<ProgressEvaluation, ProgressEvaluationDto>().ReverseMap();
                cfg.CreateMap<GeneralEvaluation, GeneralEvaluationDto>().ReverseMap();
                cfg.CreateMap<Attendance, AttendanceDto>().ReverseMap();
                cfg.CreateMap<UserVerificationCode, UserVerificationCodeDto>().ReverseMap();
                cfg.CreateMap<UserVerificationCodeResult, UserVerificationCodeDto>().ReverseMap();
                cfg.CreateMap<ClassSubjects, ClassSubjectsDto>().ReverseMap();
                cfg.CreateMap<ClassSubjectsViewDto, ClassSubjects>().ReverseMap();
                cfg.CreateMap<SubjectWithUnit, Subject>().ReverseMap();
                cfg.CreateMap<SubjectWithUnit, SubjectDto>().ReverseMap();
                cfg.CreateMap<RegistrationFees, RegistrationFeesDto>().ReverseMap();
                cfg.CreateMap<PostsViewDto, Posts>().ReverseMap();
                cfg.CreateMap<Section, SectionDto>().ReverseMap();
                cfg.CreateMap<FamilyProfile, FamilyProfileDto>().ReverseMap();
                
            });
            var mapper = config.CreateMapper();
            services.AddSingleton(mapper);

            return services;
        }
    }
}
