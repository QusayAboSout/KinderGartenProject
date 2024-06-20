using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IRestApiService
    {
        Task<T> Get<T>(string url);
    }
}
