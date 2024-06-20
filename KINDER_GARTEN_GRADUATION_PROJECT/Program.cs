using Domain.Interfaces;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;
using WebApi.ServicesConfigurations;
using DataAccess.Repositories;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using DataAccess.Data;
using WebApi.Mapper;
using JWT.Configuratoin;
using WebApi.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.GenerateActionUrlsDectionary(builder.Configuration);
builder.Services.AddTokenAuthentication(builder.Configuration);

builder.Services.AddEndpointsApiExplorer();
builder.Services.TanvirArjelConfiguration(builder.Configuration);
builder.Services.AddSwaggerGen();
builder.Services.ConfigureMapper();
builder.Services.ConfigureServices(builder.Configuration);
builder.Services.AddDbContext<DataContext>(Options => {
    Options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

var app = builder.Build();

// Configure the HTTP request pipeline.


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseMiddleware<ExceptionsMiddleware>();

app.Run();
