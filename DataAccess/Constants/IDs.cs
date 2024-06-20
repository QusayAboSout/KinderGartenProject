using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Constants
{
    public class IDs
    {
        public class Level
        {
            public static long Tamhedi = 1;
            public static long Bustan = 2;
            public static long hadane = 3;
        }

        public class Student
        {
            public static long Quasy = 1;
            public static long Amisea = 2;
        }

        public class User
        {
            public static long Admin = 1;
            public static long Teacher = 2;
            public static long Student = 3;
        }
        public class ChildCard
        {
            public static long Card1 = 1;
            public static long Card2 = 2;
        }
        public class Teacher
        {
            public static long ArabicTeacher = 1;
            public static long EnglishTeacher = 2;
            public static long ArtTeacher = 3;
        }

        public class StudentFees
        {
            public static long StdFees = 1;
        }
        public class Post
        {
            public static long post = 1;
        }
        public class Section
        {
            public static long SectionA = 1;
            public static long SectionB = 2;
            public static long SectionC = 3;
            public static long SectionD = 4;
        }
        public class Class
        {
            public static long ClassA = 1;
            public static long ClassB = 2;
        }
        public class Activity
        {
            public static long Activity1 = 1;
            public static long Activity2 = 2;
        }
        public class Attendance
        {
            public static long Attendance1 = 3;
            public static long Attendance2 = 4;
        }
        public class Comments
        {
            public static long comm1 = 1;
            public static long comm2 = 2;
        }
        public class ActivityStudent
        {
            public static long ActivStd1 = 1;
            public static long ActivStd2 = 2;
        }
        public class Attachment
        {
            public class StudentAttachment
            {
                public class Birth
                {
                    public static long BirthImage = 1;
                    public static long BirthImage2 = 2;
                }
                public class Parent
                {
                    public static long ParentImage = 1;
                    public static long ParentImage2 = 2;
                }
                public class Personal
                {
                    public static long PersonalImage = 1;
                    public static long PersonalImage2 = 2;
                }
                public class Homework
                {
                    public static long activity1 = 1;
                    public static long activity2 = 2;
                }
            }
        }
        public class AttachmentActivityStudent
        {
            public static long AttActivStd1 = 1;
            public static long AttActivStd2 = 2;
        }
        public class ContactNumbers
        {
            public static long Contact1 = 1;
            public static long Contact2 = 2;
        }
        public class Experience
        {
            public static long Expe1 = 1;
            public static long Expe2 = 2;
        }
        public class GeneralEvaluation
        {
            public static long VeryGood = 1;
            public static long Good = 2;
            public static long Bad = 3;
            public static long TooBad = 4;
        }
        public class Diseases
        {
            public static long dises1 = 1;
            public static long dises2 = 2;
        }
        public class Gurdian
        {
            public static long father = 1;
            public static long mother = 2;
        }
        public class GurdianType
        {
            public static long parent = 1;
            public static long Aunt = 2;
        }
        public class ProgressEvaluation
        {
            public static long VeryGood = 1;
            public static long Good = 2;
            public static long Bad = 3;
            public static long TooBad = 4;
        }
        public class RegistrationFees
        {
            public static long regFee = 1;
        }
        public class StudentLevel
        {
            public static long stdLevel = 1;
            public static long stdLevel2 = 2;
        }
        public class Unit
        {
            public static long Unit1 = 1;
            public static long Unit2 = 2;
            public static long Unit3 = 3;
            public static long Unit4 = 4;
        }
        public class Subject
        {
            public static long Arabic = 1;
            public static long English = 2;
        }
        public class Messaging
        {
            public static long msg1 = 1;
            public static long msg2 = 2;
        }
        public class Hobbies
        {
            public static long Hobb1 = 1;
            public static long Hobb2 = 2;
        }
    }
}
