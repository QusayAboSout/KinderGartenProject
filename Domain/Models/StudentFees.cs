using Domain.Models.Base;
using Domain.Models.Students;

namespace Domain.Models
{
    public class StudentFees : BaseEntity
    {
        public long? FeesAmount { get; set; }
        public DateOnly? FeesDate { get; set; }
        public bool? WithBus { get; set; }

        public long? StudentID { get; set; }
        public Student? student { get; set; }
        public long? ClassID { get; set; }
        public Class? Class { get; set; }

    }
}
