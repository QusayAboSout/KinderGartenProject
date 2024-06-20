using Domain.Models.Email;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IEmailSender
    {
        void SendEmail(EmailMessage message);
    }
}
