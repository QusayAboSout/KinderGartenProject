using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using JWT.Attributes;
using System.Text.RegularExpressions;
using JWT.Models.AppAction;

namespace WebApi.ServicesConfigurations
{
    public static class ActoinConfiguration
    {
        public static List<Type> HttpAttributeTypes = new List<Type> { typeof(HttpPostAttribute), typeof(HttpPutAttribute), typeof(HttpGetAttribute), typeof(HttpDeleteAttribute), typeof(HttpPatchAttribute) };
        public static IServiceCollection GenerateActionUrlsDectionary(this IServiceCollection services, IConfiguration config)
        {
            Assembly assembly = Assembly.GetExecutingAssembly();

            var Controllers = GetControllers(assembly);
            var authUrlsDictionary = new Dictionary<string, List<string>>();
            var publicUrlsDictionary = new Dictionary<string, string>();

            foreach (var controller in Controllers)
            {
                var controllerUrls = GetControllerUrlActoins(controller);
                AddToUrlsDictionary(controllerUrls, authUrlsDictionary);
                var controllerPublicUrls = GetControllerPublicUrl(controller);
                AddPublicUrlsToDictionary(controllerPublicUrls, publicUrlsDictionary);
            }

            var urlActoinsData = new UrlActoinsData(authUrlsDictionary, publicUrlsDictionary);
            services.AddSingleton<UrlActoinsData>(urlActoinsData);
            return services;
        }

        private static void AddPublicUrlsToDictionary(List<string> controllerPublicUrls, Dictionary<string, string> publicUrlsDictionary)
        {
            foreach (var url in controllerPublicUrls)
            {
                publicUrlsDictionary.Add(url, url);
            }
        }

        private static List<string> GetControllerPublicUrl(Type controller)
        {
            var methods = GetMethods(controller);
            List<string> publicUrls = new List<string>();
            foreach (var method in methods)
            {
                var auth = method.GetCustomAttribute(typeof(Auth)) as Auth;
                if (auth == null)
                    continue;
                if (!auth.Public)
                    continue;
                var url = CreateUrl(method, controller);

                publicUrls.Add(url);
            }
            return publicUrls;
        }



        private static void AddToUrlsDictionary(List<KeyValuePair<string, List<string>>> controllerUrls, Dictionary<string, List<string>> urlsDictionary)
        {
            foreach (var urlActions in controllerUrls)
            {
                urlsDictionary.Add(urlActions.Key, urlActions.Value);
            }
        }

        private static List<KeyValuePair<string, List<string>>> GetControllerUrlActoins(Type controller)
        {
            var methods = GetMethods(controller);
            List<KeyValuePair<string, List<string>>> valuePairs = new List<KeyValuePair<string, List<string>>>();
            foreach (var method in methods)
            {
                var actoins = GetActions(method);
                if (actoins == null)
                    continue;
                var url = CreateUrl(method, controller);
                valuePairs.Add(new KeyValuePair<string, List<string>>(url, actoins));
            }
            return valuePairs;
        }



        private static string CreateUrl(MethodInfo method, Type controller)
        {
            var httpMethod = GetHttpMethod(method);
            var controllerPath = GetControllerPath(controller);
            var methodName = GetApiMethodName(method);

            var result = $"{httpMethod}:/{controllerPath}{methodName}";
            result = result.ToLower();
            return result;
        }

        private static string GetApiMethodName(MethodInfo method)
        {
            var url = "";
            var httpMethodAttribute = method.CustomAttributes.Where(e =>
                        HttpAttributeTypes.Contains(e.AttributeType)).FirstOrDefault();
            if (httpMethodAttribute == null)
                url = "/" + method.Name;
            var name = httpMethodAttribute.ConstructorArguments.First().Value;
            if (name != null)
                url = "/" + name.ToString();

            string pattern = "\\{.*(?=)";
            url = Regex.Replace(url, pattern, "");
            string endPointUrl = url.Substring(url.Length - 1, 1);
            if (endPointUrl.Equals("/"))
                url = url.Substring(0, url.Length - 1);
            url = url.ToLower();
            return url;
        }

        private static string GetControllerPath(Type controller)
        {
            var controllerPathAttribute = controller.GetCustomAttribute(typeof(RouteAttribute)) as RouteAttribute;
            var controllerName = controller.Name.Replace("Controller", "");
            if (controllerPathAttribute == null)
                return controllerName;
            var controllerPath = controllerPathAttribute.Template.Replace("[controller]", controllerName);
            return controllerPath;
        }

        private static string GetHttpMethod(MethodInfo method)
        {
            var httpMethodAttribute = method.CustomAttributes.Where(e =>
                        HttpAttributeTypes.Contains(e.AttributeType)).FirstOrDefault();
            if (httpMethodAttribute == null)
                return "GET";
            return httpMethodAttribute.AttributeType.Name.Replace("Http", "").Replace("Attribute", "").ToUpper();
        }

        private static List<MethodInfo> GetMethods(Type controller)
        {
            return controller.GetMethods().Where(method => method.IsPublic
                                && !method.IsDefined(typeof(NonActionAttribute))
                                && method.IsDefined(typeof(Auth))
                                ).ToList();
        }

        private static List<Type> GetControllers(Assembly asm)
        {
            return asm.GetTypes().Where(type => typeof(ControllerBase).IsAssignableFrom(type)) //filter controllers
                            .ToList();
        }

        private static List<string> GetActions(MethodInfo method)
        {

            var auth = method.GetCustomAttribute(typeof(Auth)) as Auth;
            if (auth == null) return null;
            if (string.IsNullOrEmpty(auth.Actions))
                return new List<string>();
            return auth.Actions.Split(',').ToList();

        }
    }

}
