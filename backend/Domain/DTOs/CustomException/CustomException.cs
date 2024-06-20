using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.CustomException
{
    public class CustomException : Exception
    {
        public List<ExceptionMessage> Messages;

        public CustomException(string code, object? variables = null)
        {
            Messages = new List<ExceptionMessage>() { new ExceptionMessage() { messageCode = code, variables = variables } };
        }

        public CustomException(List<ExceptionMessage> exceptionMessage)
        {
            this.Messages = exceptionMessage;
        }
    }
    public class ExceptionResult
    {
        public List<ExceptionMessage> messages { get; set; }

    }
    public class ExceptionMessage
    {
        public ExceptionMessage()
        {
        }

        public ExceptionMessage(string messageCode, object? variables = null)
        {
            this.messageCode = messageCode;
            this.variables = variables;
        }

        public string messageCode { get; set; }
        public object? variables { get; set; }

    }
}
