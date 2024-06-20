using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Extention
{
    public class ExpressionOperation
    {
        public static Expression<Func<T, TReturn>> Join<T, TReturn>(Func<Expression, Expression, BinaryExpression> joiner, IReadOnlyCollection<Expression<Func<T, TReturn>>> expressions)
        {
            if (!expressions.Any())
            {
                throw new ArgumentException("No expressions were provided");
            }
            var firstExpression = expressions.First();
            var otherExpressions = expressions.Skip(1);
            var firstParameter = firstExpression.Parameters.Single();
            var otherExpressionsWithParameterReplaced = otherExpressions.Select(e => ReplaceParameter(e.Body, e.Parameters.Single(), firstParameter));
            var bodies = new[] { firstExpression.Body }.Concat(otherExpressionsWithParameterReplaced);
            var joinedBodies = bodies.Aggregate(joiner);
            return Expression.Lambda<Func<T, TReturn>>(joinedBodies, firstParameter);
        }

        public static T ReplaceParameter<T>(T expr, ParameterExpression toReplace, ParameterExpression replacement)
            where T : Expression
        {
            var replacer = new ExpressionReplacer(e => e == toReplace ? replacement : e);
            return (T)replacer.Visit(expr);
        }
    }
}
