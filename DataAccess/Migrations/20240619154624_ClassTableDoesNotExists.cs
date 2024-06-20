using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class ClassTableDoesNotExists : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Attachments",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Path = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Attachments", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Attendances",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IfExists = table.Column<bool>(type: "bit", nullable: false),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Attendances", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "GuardianType",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GuardianType", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Level",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FeesAmount = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Level", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "RegistrationFees",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FeesAmount = table.Column<long>(type: "bigint", nullable: true),
                    BusAmount = table.Column<long>(type: "bigint", nullable: true),
                    Level = table.Column<long>(type: "bigint", nullable: true),
                    Year = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RegistrationFees", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Subjects",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subjects", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Role = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    GoogleAccessToken = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "ChildCards",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BirthOfDate = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CardFillDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    NumberOfBrothers = table.Column<long>(type: "bigint", nullable: true),
                    NumberOfSisters = table.Column<long>(type: "bigint", nullable: true),
                    ChildArrangement = table.Column<long>(type: "bigint", nullable: true),
                    NumberOfSpicailNeeds = table.Column<long>(type: "bigint", nullable: true),
                    UserID = table.Column<long>(type: "bigint", nullable: true),
                    KindergartenName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StudentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FatherName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GrandFatherName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FamilyName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BirthPlace = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Nationality = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Religion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FatherProfession = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FatherWorkPhone = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FatherWorkPlace = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    phoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MotherWorkPhone = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MotherWorkPlace = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FatherEducationLevel = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MotherEducationLevel = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EmergencyPhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    childLivesWith = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ParentsSituation = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DiseasesOfTheChild = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TheAuthoritySupervisingDisability = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ExtraInfo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GurdianName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TeacherName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ManegerName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TheTypeOfConditionTheChildIsFacing = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConditionDescription = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConditionReasons = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConditionRelatedIndicators = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HowTheCaseMonitoredDone = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RejectReason = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DidStudentHaveSurgery = table.Column<bool>(type: "bit", nullable: true),
                    DidHeTakesMedication = table.Column<bool>(type: "bit", nullable: true),
                    DidHeTakesHealthVaccinations = table.Column<bool>(type: "bit", nullable: true),
                    ChildReceivedAllTheRequiredVaccinations = table.Column<bool>(type: "bit", nullable: true),
                    FromSpecialNeeds = table.Column<bool>(type: "bit", nullable: true),
                    IsThereAnyoneInTheFamilyWithSpecialNeeds = table.Column<bool>(type: "bit", nullable: true),
                    HaveChaildAttendedKindergartenBefore = table.Column<bool>(type: "bit", nullable: true),
                    isCheck = table.Column<bool>(type: "bit", nullable: true),
                    Status = table.Column<bool>(type: "bit", nullable: true),
                    PersonalImageID = table.Column<long>(type: "bigint", nullable: true),
                    BirthCertificateImageID = table.Column<long>(type: "bigint", nullable: true),
                    ParentIdentifyImageID = table.Column<long>(type: "bigint", nullable: true),
                    StudentPersonImageID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ChildCards", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ChildCards_Attachments_BirthCertificateImageID",
                        column: x => x.BirthCertificateImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ChildCards_Attachments_ParentIdentifyImageID",
                        column: x => x.ParentIdentifyImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ChildCards_Attachments_PersonalImageID",
                        column: x => x.PersonalImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ChildCards_Attachments_StudentPersonImageID",
                        column: x => x.StudentPersonImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Units",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SubjectID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Units", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Units_Subjects_SubjectID",
                        column: x => x.SubjectID,
                        principalTable: "Subjects",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Guardians",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GurdianName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    GuardianTypeID = table.Column<long>(type: "bigint", nullable: false),
                    UserID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Guardians", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Guardians_GuardianType_GuardianTypeID",
                        column: x => x.GuardianTypeID,
                        principalTable: "GuardianType",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Guardians_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Messagings",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Sender = table.Column<bool>(type: "bit", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    text = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserID = table.Column<long>(type: "bigint", nullable: false),
                    User2ID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Messagings", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Messagings_Users_User2ID",
                        column: x => x.User2ID,
                        principalTable: "Users",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Messagings_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Postss",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Discription = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PostDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Postss", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Postss_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Teachers",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TeacherName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IdNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SpeciallizationName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teachers", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Teachers_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "UserVerificationCodes",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<long>(type: "bigint", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpiredDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    RequestCount = table.Column<int>(type: "int", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserVerificationCodes", x => x.ID);
                    table.ForeignKey(
                        name: "FK_UserVerificationCodes_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "ContactNumbers",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ContactName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ContactNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    GuardianID = table.Column<long>(type: "bigint", nullable: false),
                    ChildCardID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ContactNumbers", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ContactNumbers_ChildCards_ChildCardID",
                        column: x => x.ChildCardID,
                        principalTable: "ChildCards",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ContactNumbers_Guardians_GuardianID",
                        column: x => x.GuardianID,
                        principalTable: "Guardians",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Comments",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Comment = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserID = table.Column<long>(type: "bigint", nullable: false),
                    PostID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comments", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Comments_Postss_PostID",
                        column: x => x.PostID,
                        principalTable: "Postss",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Comments_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Experiences",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ExperienceName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NumberOfYears = table.Column<long>(type: "bigint", nullable: true),
                    TeacherID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Experiences", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Experiences_Teachers_TeacherID",
                        column: x => x.TeacherID,
                        principalTable: "Teachers",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Section",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClassName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ClassYear = table.Column<long>(type: "bigint", nullable: false),
                    GeneralEvaluationID = table.Column<long>(type: "bigint", nullable: true),
                    AttendanceID = table.Column<long>(type: "bigint", nullable: true),
                    TeacherID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Section", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Section_Attendances_AttendanceID",
                        column: x => x.AttendanceID,
                        principalTable: "Attendances",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Section_Teachers_TeacherID",
                        column: x => x.TeacherID,
                        principalTable: "Teachers",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Activities",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ActivityName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Mark = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ClassID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Activities", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Activities_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ClassSubjects",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    SubjectID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClassSubjects", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ClassSubjects_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ClassSubjects_Subjects_SubjectID",
                        column: x => x.SubjectID,
                        principalTable: "Subjects",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "GurdianTypes",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GurdianTypes", x => x.ID);
                    table.ForeignKey(
                        name: "FK_GurdianTypes_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Students",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StudentName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StudentLocation = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BirthCertificateImageID = table.Column<long>(type: "bigint", nullable: true),
                    ParentCertificateImageID = table.Column<long>(type: "bigint", nullable: true),
                    PersonalImageID = table.Column<long>(type: "bigint", nullable: true),
                    ParentPhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    userID = table.Column<long>(type: "bigint", nullable: true),
                    GuardianID = table.Column<long>(type: "bigint", nullable: true),
                    GeneralEvaluationID = table.Column<long>(type: "bigint", nullable: true),
                    AttendanceID = table.Column<long>(type: "bigint", nullable: true),
                    ChildCardID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Students", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Students_Attachments_BirthCertificateImageID",
                        column: x => x.BirthCertificateImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_Attachments_ParentCertificateImageID",
                        column: x => x.ParentCertificateImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_Attachments_PersonalImageID",
                        column: x => x.PersonalImageID,
                        principalTable: "Attachments",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_Attendances_AttendanceID",
                        column: x => x.AttendanceID,
                        principalTable: "Attendances",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_ChildCards_ChildCardID",
                        column: x => x.ChildCardID,
                        principalTable: "ChildCards",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_Students_Users_userID",
                        column: x => x.userID,
                        principalTable: "Users",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "ActivityStudents",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsDone = table.Column<bool>(type: "bit", nullable: false),
                    StudentID = table.Column<long>(type: "bigint", nullable: false),
                    ActivityID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ActivityStudents", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ActivityStudents_Activities_ActivityID",
                        column: x => x.ActivityID,
                        principalTable: "Activities",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ActivityStudents_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Diseases",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DiseaseName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DiseaseLevel = table.Column<long>(type: "bigint", nullable: false),
                    StudentID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Diseases", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Diseases_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GeneralEvaluations",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Grade = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StudentID = table.Column<long>(type: "bigint", nullable: true),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    SubjectID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GeneralEvaluations", x => x.ID);
                    table.ForeignKey(
                        name: "FK_GeneralEvaluations_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_GeneralEvaluations_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_GeneralEvaluations_Subjects_SubjectID",
                        column: x => x.SubjectID,
                        principalTable: "Subjects",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "Hobbies",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HobbiesName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StudentID = table.Column<long>(type: "bigint", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hobbies", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Hobbies_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProgressEvaluations",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Grade = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateOnly>(type: "date", nullable: true),
                    StudentID = table.Column<long>(type: "bigint", nullable: true),
                    UnitID = table.Column<long>(type: "bigint", nullable: true),
                    SubjectID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProgressEvaluations", x => x.ID);
                    table.ForeignKey(
                        name: "FK_ProgressEvaluations_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ProgressEvaluations_Subjects_SubjectID",
                        column: x => x.SubjectID,
                        principalTable: "Subjects",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_ProgressEvaluations_Units_UnitID",
                        column: x => x.UnitID,
                        principalTable: "Units",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "StudentFees",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FeesAmount = table.Column<long>(type: "bigint", nullable: true),
                    FeesDate = table.Column<DateOnly>(type: "date", nullable: true),
                    WithBus = table.Column<bool>(type: "bit", nullable: true),
                    StudentID = table.Column<long>(type: "bigint", nullable: true),
                    ClassID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentFees", x => x.ID);
                    table.ForeignKey(
                        name: "FK_StudentFees_Section_ClassID",
                        column: x => x.ClassID,
                        principalTable: "Section",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_StudentFees_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "StudentLevels",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StudentID = table.Column<long>(type: "bigint", nullable: true),
                    LevelID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentLevels", x => x.ID);
                    table.ForeignKey(
                        name: "FK_StudentLevels_Level_LevelID",
                        column: x => x.LevelID,
                        principalTable: "Level",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_StudentLevels_Students_StudentID",
                        column: x => x.StudentID,
                        principalTable: "Students",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "AttachmentActivityStudents",
                columns: table => new
                {
                    ID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AttachementID = table.Column<long>(type: "bigint", nullable: true),
                    AttachmentID = table.Column<long>(type: "bigint", nullable: false),
                    ActivityStudentID = table.Column<long>(type: "bigint", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AttachmentActivityStudents", x => x.ID);
                    table.ForeignKey(
                        name: "FK_AttachmentActivityStudents_ActivityStudents_ActivityStudentID",
                        column: x => x.ActivityStudentID,
                        principalTable: "ActivityStudents",
                        principalColumn: "ID");
                    table.ForeignKey(
                        name: "FK_AttachmentActivityStudents_Attachments_AttachmentID",
                        column: x => x.AttachmentID,
                        principalTable: "Attachments",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Section",
                columns: new[] { "ID", "AttendanceID", "ClassName", "ClassYear", "CreateDate", "GeneralEvaluationID", "TeacherID" },
                values: new object[,]
                {
                    { 1L, null, "براعم", 2024L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null },
                    { 2L, null, "بستان", 2024L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, null }
                });

            migrationBuilder.InsertData(
                table: "Subjects",
                columns: new[] { "ID", "CreateDate", "Name" },
                values: new object[,]
                {
                    { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "رياضيات براعم" },
                    { 2L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "عربي براعم" }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "ID", "CreateDate", "Email", "GoogleAccessToken", "IsActive", "Name", "Password", "Role", "UserName" },
                values: new object[,]
                {
                    { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "q201612@gmail.com", null, true, "هنا عواودة", "google@1", "admin", "q201612@gmail.com" },
                    { 2L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "qusay201612@gmail.com", null, true, "تسنيم عواودة", "google@2", "teacher", "qusay201612@gmail.com" }
                });

            migrationBuilder.InsertData(
                table: "GurdianTypes",
                columns: new[] { "ID", "ClassID", "CreateDate", "Name" },
                values: new object[,]
                {
                    { 1L, 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "شعبة أ" },
                    { 2L, 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "شعبة ب" },
                    { 3L, 2L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "شعبة أ" },
                    { 4L, 2L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "شعبة ج" }
                });

            migrationBuilder.InsertData(
                table: "Postss",
                columns: new[] { "ID", "CreateDate", "Discription", "PostDate", "UserID" },
                values: new object[] { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "غدا سيكون موعد دفع الرسوم", new DateTime(2024, 6, 19, 18, 46, 24, 476, DateTimeKind.Local).AddTicks(6651), 1L });

            migrationBuilder.InsertData(
                table: "Teachers",
                columns: new[] { "ID", "CreateDate", "IdNumber", "PhoneNumber", "SpeciallizationName", "TeacherName", "UserID" },
                values: new object[] { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "3827378336", "0596283683", "اللغة العربية", "تسنيم منصور", 2L });

            migrationBuilder.InsertData(
                table: "Units",
                columns: new[] { "ID", "CreateDate", "Name", "SubjectID" },
                values: new object[,]
                {
                    { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "الارقام العشرية", 1L },
                    { 2L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "حرف الألف", 2L },
                    { 3L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "الأرقام", 1L },
                    { 4L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "حرف الباء", 2L }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Activities_ClassID",
                table: "Activities",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_ActivityStudents_ActivityID",
                table: "ActivityStudents",
                column: "ActivityID");

            migrationBuilder.CreateIndex(
                name: "IX_ActivityStudents_StudentID",
                table: "ActivityStudents",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_AttachmentActivityStudents_ActivityStudentID",
                table: "AttachmentActivityStudents",
                column: "ActivityStudentID");

            migrationBuilder.CreateIndex(
                name: "IX_AttachmentActivityStudents_AttachmentID",
                table: "AttachmentActivityStudents",
                column: "AttachmentID");

            migrationBuilder.CreateIndex(
                name: "IX_ChildCards_BirthCertificateImageID",
                table: "ChildCards",
                column: "BirthCertificateImageID");

            migrationBuilder.CreateIndex(
                name: "IX_ChildCards_ParentIdentifyImageID",
                table: "ChildCards",
                column: "ParentIdentifyImageID");

            migrationBuilder.CreateIndex(
                name: "IX_ChildCards_PersonalImageID",
                table: "ChildCards",
                column: "PersonalImageID");

            migrationBuilder.CreateIndex(
                name: "IX_ChildCards_StudentPersonImageID",
                table: "ChildCards",
                column: "StudentPersonImageID");

            migrationBuilder.CreateIndex(
                name: "IX_ClassSubjects_ClassID",
                table: "ClassSubjects",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_ClassSubjects_SubjectID",
                table: "ClassSubjects",
                column: "SubjectID");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_PostID",
                table: "Comments",
                column: "PostID");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_UserID",
                table: "Comments",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_ContactNumbers_ChildCardID",
                table: "ContactNumbers",
                column: "ChildCardID");

            migrationBuilder.CreateIndex(
                name: "IX_ContactNumbers_GuardianID",
                table: "ContactNumbers",
                column: "GuardianID");

            migrationBuilder.CreateIndex(
                name: "IX_Diseases_StudentID",
                table: "Diseases",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_Experiences_TeacherID",
                table: "Experiences",
                column: "TeacherID");

            migrationBuilder.CreateIndex(
                name: "IX_GeneralEvaluations_ClassID",
                table: "GeneralEvaluations",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_GeneralEvaluations_StudentID",
                table: "GeneralEvaluations",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_GeneralEvaluations_SubjectID",
                table: "GeneralEvaluations",
                column: "SubjectID");

            migrationBuilder.CreateIndex(
                name: "IX_Guardians_GuardianTypeID",
                table: "Guardians",
                column: "GuardianTypeID");

            migrationBuilder.CreateIndex(
                name: "IX_Guardians_UserID",
                table: "Guardians",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_GurdianTypes_ClassID",
                table: "GurdianTypes",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_Hobbies_StudentID",
                table: "Hobbies",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_Messagings_User2ID",
                table: "Messagings",
                column: "User2ID");

            migrationBuilder.CreateIndex(
                name: "IX_Messagings_UserID",
                table: "Messagings",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_Postss_UserID",
                table: "Postss",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_ProgressEvaluations_StudentID",
                table: "ProgressEvaluations",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_ProgressEvaluations_SubjectID",
                table: "ProgressEvaluations",
                column: "SubjectID");

            migrationBuilder.CreateIndex(
                name: "IX_ProgressEvaluations_UnitID",
                table: "ProgressEvaluations",
                column: "UnitID");

            migrationBuilder.CreateIndex(
                name: "IX_Section_AttendanceID",
                table: "Section",
                column: "AttendanceID");

            migrationBuilder.CreateIndex(
                name: "IX_Section_TeacherID",
                table: "Section",
                column: "TeacherID",
                unique: true,
                filter: "[TeacherID] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_StudentFees_ClassID",
                table: "StudentFees",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_StudentFees_StudentID",
                table: "StudentFees",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_StudentLevels_LevelID",
                table: "StudentLevels",
                column: "LevelID");

            migrationBuilder.CreateIndex(
                name: "IX_StudentLevels_StudentID",
                table: "StudentLevels",
                column: "StudentID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_AttendanceID",
                table: "Students",
                column: "AttendanceID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_BirthCertificateImageID",
                table: "Students",
                column: "BirthCertificateImageID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_ChildCardID",
                table: "Students",
                column: "ChildCardID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_ClassID",
                table: "Students",
                column: "ClassID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_ParentCertificateImageID",
                table: "Students",
                column: "ParentCertificateImageID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_PersonalImageID",
                table: "Students",
                column: "PersonalImageID");

            migrationBuilder.CreateIndex(
                name: "IX_Students_userID",
                table: "Students",
                column: "userID");

            migrationBuilder.CreateIndex(
                name: "IX_Teachers_UserID",
                table: "Teachers",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_Units_SubjectID",
                table: "Units",
                column: "SubjectID");

            migrationBuilder.CreateIndex(
                name: "IX_UserVerificationCodes_UserId",
                table: "UserVerificationCodes",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AttachmentActivityStudents");

            migrationBuilder.DropTable(
                name: "ClassSubjects");

            migrationBuilder.DropTable(
                name: "Comments");

            migrationBuilder.DropTable(
                name: "ContactNumbers");

            migrationBuilder.DropTable(
                name: "Diseases");

            migrationBuilder.DropTable(
                name: "Experiences");

            migrationBuilder.DropTable(
                name: "GeneralEvaluations");

            migrationBuilder.DropTable(
                name: "GurdianTypes");

            migrationBuilder.DropTable(
                name: "Hobbies");

            migrationBuilder.DropTable(
                name: "Messagings");

            migrationBuilder.DropTable(
                name: "ProgressEvaluations");

            migrationBuilder.DropTable(
                name: "RegistrationFees");

            migrationBuilder.DropTable(
                name: "StudentFees");

            migrationBuilder.DropTable(
                name: "StudentLevels");

            migrationBuilder.DropTable(
                name: "UserVerificationCodes");

            migrationBuilder.DropTable(
                name: "ActivityStudents");

            migrationBuilder.DropTable(
                name: "Postss");

            migrationBuilder.DropTable(
                name: "Guardians");

            migrationBuilder.DropTable(
                name: "Units");

            migrationBuilder.DropTable(
                name: "Level");

            migrationBuilder.DropTable(
                name: "Activities");

            migrationBuilder.DropTable(
                name: "Students");

            migrationBuilder.DropTable(
                name: "GuardianType");

            migrationBuilder.DropTable(
                name: "Subjects");

            migrationBuilder.DropTable(
                name: "ChildCards");

            migrationBuilder.DropTable(
                name: "Section");

            migrationBuilder.DropTable(
                name: "Attachments");

            migrationBuilder.DropTable(
                name: "Attendances");

            migrationBuilder.DropTable(
                name: "Teachers");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
