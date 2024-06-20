using Domain.Models.CustomException;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Extention
{
    public static class LinqExtension
    {
        public static IQueryable<T> OrderBy<T>(this IQueryable<T> source, string ordering, bool ascending = true)
        {
            var type = typeof(T);
            var parameter = Expression.Parameter(type, "p");
            PropertyInfo property;
            Expression propertyAccess;
            if (ordering.Contains('.'))
            {
                // support to be sorted on child fields.
                String[] childProperties = ordering.Split('.');
                property = type.GetProperty(childProperties[0]);
                if (property == null)
                    throw new CustomException("Sort_By_Coulmn_Name_Not_Correct");
                propertyAccess = Expression.MakeMemberAccess(parameter, property);
                for (int i = 1; i < childProperties.Length; i++)
                {
                    property = property.PropertyType.GetProperty(childProperties[i]);
                    if (property == null)
                        throw new CustomException("Sort_By_Coulmn_Name_Not_Correct");
                    propertyAccess = Expression.MakeMemberAccess(propertyAccess, property);
                }

            }
            else
            {
                property = typeof(T).GetProperty(ordering);
                if (property == null)
                    throw new CustomException("Sort_By_Coulmn_Name_Not_Correct");
                propertyAccess = Expression.MakeMemberAccess(parameter, property);
            }
            var orderByExp = Expression.Lambda(propertyAccess, parameter);
            MethodCallExpression resultExp = Expression.Call(typeof(Queryable),
                                                             ascending ? "OrderBy" : "OrderByDescending",
                                                             new[] { type, property.PropertyType }, source.Expression,
                                                             Expression.Quote(orderByExp));
            //return  source.OrderBy(x => orderByExp);
            return source.Provider.CreateQuery<T>(resultExp);
        }
    }
}
