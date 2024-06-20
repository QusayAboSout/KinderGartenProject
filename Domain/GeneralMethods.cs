using Domain.Models.CustomException;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Collections;
using Domain.Models.Base;
using Domain.Models.SortablePaginationSearch;
using Domain.Models.SortablePagination;
using Domain.Extention;

namespace Domain
{
    public static class GeneralMethods
    {
        public static string GetEncryptionPassword(string password, decimal userId)
        {
            byte[] salt = new byte[128 / 8];

            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }
            var salt64 = Convert.ToBase64String(salt);


            // derive a 256-bit subkey (use HMACSHA1 with 10,000 iterations)
            string hashed = GetHash(password, salt, salt64, userId);
            return hashed;
        }

        private static string GetHash(string password, byte[] salt, string salt64, decimal userId)
        {
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: password + userId,
                salt: salt,
                prf: KeyDerivationPrf.HMACSHA1,
                iterationCount: 10000,
                numBytesRequested: 256 / 8));
            hashed = salt64 + hashed;
            return hashed;
        }
        public static bool CheckPassword(string savedPassword, string password, decimal userId)
        {
            try
            {
                string salt64 = savedPassword.Substring(0, 24);
                var salt = Convert.FromBase64String(salt64);
                string hashed = GetHash(password, salt, salt64, userId);
                if (hashed == savedPassword)
                    return true;
            }
            catch (Exception e)
            {
                throw new CustomException("Check_Password_Error");
            }
            return false;

        }

        public static long? GetUserID(ClaimsPrincipal? user)
        {
            try
            {
                return long.Parse(user.FindFirst("ID")?.Value);
            }
            catch (Exception)
            {
                return null;
            }
        }
        public static long? GetTenantID(ClaimsPrincipal? user)
        {
            try
            {
                return long.Parse(user.FindFirst("Tenant")?.Value);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static IQueryable<E> ApplySortablePagnation<E>(SortablePagentionDto sortablePagentionDto, IQueryable<E> query)
        {
            if (sortablePagentionDto == null)
                return query;

            if (!string.IsNullOrEmpty(sortablePagentionDto?.SortField))

            {
                query = ApplyOrder(sortablePagentionDto, query);
            }

            query = ApplyPagention(sortablePagentionDto, query);
            return query;
        }

        public static IQueryable<E> ApplySortablePagnationDateFilter<E>(SortablePagentionSerchableDto sortablePagentionDto, IQueryable<E> query) where E : BaseEntity
        {

            query = ApplySortablePagnation(sortablePagentionDto, query);
            if (sortablePagentionDto.FromDate != null)
            {
                query = query.Where(e => e.CreateDate.Date >= sortablePagentionDto.FromDate.Value.Date);
            }
            if (sortablePagentionDto.ToDate != null)
            {
                query = query.Where(e => e.CreateDate.Date <= sortablePagentionDto.ToDate.Value.Date);
            }
            return query;
        }

        private static IQueryable<E> ApplyOrder<E>(SortablePagentionDto sortablePagentionDto, IQueryable<E> query)
        {
            var firstChar = sortablePagentionDto.SortField[0];
            firstChar = firstChar.ToString().ToUpper()[0];
            sortablePagentionDto.SortField = firstChar + sortablePagentionDto.SortField.Substring(1);

            query = query.OrderBy(sortablePagentionDto.SortField, sortablePagentionDto.SortOrder?.ToLower() == "asc");
            return query;
        }

        public static IQueryable<E> ApplyPagention<E>(PagentionDto sortablePagentionDto, IQueryable<E> query)
        {
            if (sortablePagentionDto.SkipCount == null)
                sortablePagentionDto.SkipCount = 0;

            if (sortablePagentionDto.SkipCount < 1)
                sortablePagentionDto.SkipCount = 0;

            if (sortablePagentionDto.MaxResultCount < 0)
                sortablePagentionDto.MaxResultCount = 0;
            if (sortablePagentionDto.MaxResultCount.HasValue)
                query = query.Skip(sortablePagentionDto.SkipCount.Value).Take(sortablePagentionDto.MaxResultCount.Value);
            return query;
        }



        public static string GenerateRandomString(int length, bool withAt = false)
        {
            var size = length;
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                if (withAt && length == size - 4)
                    res.Append("@");
                else
                    res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }



        public static string FixName(string name)
        {
            name = name.Replace('أ', 'ا');
            name = name.Replace('إ', 'ا');
            name = name.Replace('ة', 'ه');
            name = name.Replace('ت', 'ه');
            name = name.Replace('ى', 'ا');
            name = name.Replace('ي', 'ا');
            name = name.Replace('ئ', 'ا');
            name = name.Replace('ؤ', 'ا');
            name = name.Replace('ء', 'ا');
            name = name.Replace('ئ', 'ا');
            name = name.Replace('إ', 'ا');
            name = name.Replace('آ', 'ا');
            name = name.Replace("  ", " ");
            name = name.Replace("عبدربه", "عبد ربه");
            name = name.Replace("عبدا", "عبد ا");
            return name;
        }

        internal static void ConvertDate(object obj)
        {
            if (obj == null)
                return;
            var props = obj.GetType().GetProperties();
            foreach (var prop in props)
            {
                object propValue = prop.GetValue(obj, null);
                if (propValue == null)
                    continue;
                var elems = propValue as IList;
                if (elems != null)
                {
                    foreach (var item in elems)
                    {
                        ConvertDate(item);
                    }
                }
                else
                {
                    if (prop.PropertyType.Assembly == obj.GetType().Assembly)
                    {

                        ConvertDate(propValue);
                    }
                    else if (prop.PropertyType == typeof(DateTime))
                    {
                        var dateObj = prop.GetValue(obj);
                        if (dateObj == null)
                            continue;
                        var date = (DateTime)dateObj;
                        date = date.ToLocalTime();
                        prop.SetValue(obj, date);
                    }

                }



            }
        }

        public static string RemoveSpaces(string value)
        {
            if (!value.Contains("  "))
                return value;
            value = value.Replace("  ", " ");
            return RemoveSpaces(value);
        }

        public static string GetFileExtention(string fileName)
        {
            var splitName = fileName.Split('.');
            if (splitName.Length <= 1)
                throw new CustomException("File_Name_Error");
            var type = splitName[splitName.Length - 1];
            return "." + type;
        }
    }
}
