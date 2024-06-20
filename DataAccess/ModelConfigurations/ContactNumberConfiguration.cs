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
    public class ContactNumbersConfiguration
    {
        public ContactNumbersConfiguration(EntityTypeBuilder<ContactNumbers> entityTypeBuilder)
        {
          //  entityTypeBuilder.HasData(CreateData());
        }

        private List<ContactNumbers> CreateData()
        {
            return new List<ContactNumbers>()
            {
                new ContactNumbers()
                {
                    ID = IDs.ContactNumbers.Contact1,
                    ContactName = "محمد ابراهيم",
                    ContactNumber = "0595913851",
                    GuardianID = IDs.Gurdian.father,
                    ChildCardID = IDs.ChildCard.Card1,
                },
                new ContactNumbers()
                {
                    ID = IDs.ContactNumbers.Contact2,
                    ContactName = "خليل علي",
                    ContactNumber = "0593311391",
                    GuardianID = IDs.Gurdian.mother,
                    ChildCardID = IDs.ChildCard.Card2,
                },
            };
        }
    }
}
