
using Domain.IServices;
using Domain.Models.CustomException;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Services
{
    public class RestApiService : IRestApiService
    {


        public RestApiService()
        {

        }

        public async Task<T> Get<T>(string url)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // API endpoint URL
                    string apiUrl = url;

                    // Send GET request
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    // Check if request is successful
                    if (response.IsSuccessStatusCode)
                    {
                        // Read content as string
                        string responseBody = await response.Content.ReadAsStringAsync();
                        var result = JsonConvert.DeserializeObject<T>(responseBody);
                        // Use the response data as needed
                        return result;
                    }
                    else
                    {
                        throw new CustomException("Call_Error");
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

    }
}
