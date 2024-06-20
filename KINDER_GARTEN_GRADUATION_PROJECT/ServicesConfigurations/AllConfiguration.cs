using Domain.Models.EmailConfiguration;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace WebApi.ServicesConfigurations
{
    public static class AllConfiguration
    {
        public static IServiceCollection TanvirArjelConfiguration(this IServiceCollection services, IConfiguration Configuration)
        {
            services.AddServicesOfAllTypes(new string[]{ "Domain", "DataAccess" });
            return services;
        }
        public static IServiceCollection ConfigureServices(this IServiceCollection services, IConfiguration Configuration)
        {
            var emailConfig = Configuration
                .GetSection("EmailConfiguration")
                .Get<EmailConfiguration>();
            services.AddSingleton(emailConfig);
            services.AddControllers();
            return services;
        }

    }
}
