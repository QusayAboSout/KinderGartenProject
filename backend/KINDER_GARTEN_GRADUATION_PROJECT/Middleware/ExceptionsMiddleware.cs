using AutoMapper;
using Domain.IServices;
using Domain.Models.CustomException;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace WebApi.Middleware
{
    public class ExceptionsMiddleware
    {
        private readonly RequestDelegate _next;
        private IMapper _mapper;
        public ExceptionsMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task InvokeAsync(HttpContext httpContext, IServiceProvider serviceProvider, IMapper mapper)
        {
            _mapper = mapper;
            try
            {
                await _next(httpContext);
            }
            catch (CustomException ex)
            {
                await HandleCustomExceptionAsync(httpContext, ex);
            }
            catch (Exception ex)
            {

                await HandleExceptionAsync(httpContext, ex);
            }
        }
        private async Task HandleCustomExceptionAsync(HttpContext context, CustomException exception)
        {
            context.Response.StatusCode = 555;
            var result = new ExceptionResult() { messages = exception.Messages };
            var json = JsonConvert.SerializeObject(result);
            context.Response.ContentType = "application/json";

            await context.Response.WriteAsync(json);

        }

        private async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.StatusCode = 500;
            var messages = GetMessages(exception);
            var result = new ExceptionResult() { messages = messages };
            var json = JsonConvert.SerializeObject(result);
            context.Response.ContentType = "application/json";
            await context.Response.WriteAsync(json);
        }

        private static List<ExceptionMessage> GetMessages(Exception? exception)
        {
            var messages = new List<ExceptionMessage>();
            if (exception != null)
            {
                messages.Add(new ExceptionMessage(exception.Message));
                messages.AddRange(GetMessages(exception.InnerException));
            }
            return messages;
        }
    }
}
