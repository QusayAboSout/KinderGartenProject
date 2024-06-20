using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Constants
{
    public static class ApiActions
    {
        public static class Translate
        {
            public const string GetLanguages = $"{ActionsConstants.Languages}";
            public const string GetLanguage = $"{ActionsConstants.Languages},{ActionsConstants.Languages_Edit}";
            public const string AddLanguage = $"{ActionsConstants.Languages_Add}";
            public const string UpdateLanguage = $"{ActionsConstants.Languages_Edit}";
            public const string GetLanguageListLookup = $"{ActionsConstants.Languages_Add},{ActionsConstants.Languages_Edit}";
            public const string DeleteLanguage = $"{ActionsConstants.Languages_Delete}";

            public const string AddLanguageText = $"{ActionsConstants.Languages_LanguageTexts_Add}";
            public const string GetLanguageText = $"{ActionsConstants.Languages_LanguageTexts},{ActionsConstants.Languages_LanguageTexts}";
            public const string UpdateLanguageText = $"{ActionsConstants.Languages_LanguageTexts_Edit}";
            public const string GetAllLanguageTexts = $"{ActionsConstants.Languages_LanguageTexts}";


        }

        public static class AppRole
        {
            public const string GetAppRoles = $"{ActionsConstants.AppRoles}";
            public const string GetActions = $"{ActionsConstants.AppRoles_Add},{ActionsConstants.AppRoles_Edit}";
            public const string GetAppRole = $"{ActionsConstants.AppRoles_Edit}";
            public const string DeleteAppRole = $"{ActionsConstants.AppRoles_Delete}";
            public const string AddAppRole = $"{ActionsConstants.AppRoles_Add}";
            public const string UpdateAppRole = $"{ActionsConstants.AppRoles_Edit}";



        }
        
        public static class Person

        {
            public const string GetPersons = $"{ActionsConstants.Employers},{ActionsConstants.Users_Add},{ActionsConstants.Users_Edit}";
            public const string GetAllPersonLookUp = $"{ActionsConstants.Employers},{ActionsConstants.Users_Add},{ActionsConstants.Users_Edit}";
            public const string GetPersonById = $"{ActionsConstants.Employers_Edit}";
            public const string AddPerson = $"{ActionsConstants.Employers_Add}";
            public const string UpdatePerson = $"{ActionsConstants.Employers_Edit}";
            public const string DeletePerson = $"{ActionsConstants.Employers_Delete}";

        }
        
        public static class User
        {
            public const string GetUsers = $"{ActionsConstants.Users}";
            public const string GetUser = $"{ActionsConstants.Users_Edit}";
            public const string AddUser = $"{ActionsConstants.Users_Add}";
            public const string UpdateUser = $"{ActionsConstants.Users_Edit}";
            public const string ChangePassword = $".";
            public const string ResetPassword = $".";
            public const string ChangeDefaultLanguage = $".";
            public const string GetUserRoles = $"{ActionsConstants.Users}";
            public const string AddRolesToUser = $"{ActionsConstants.Users_Roles}";
            public const string GetUnassignRolesForUser = $"{ActionsConstants.Users_Roles}";
            public const string DeleteRoleFromUser = $"{ActionsConstants.Users_Roles}";
           



        }

        

    }
}
