using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
namespace Domain.Extention
{
    public class ExpressionReplacer : ExpressionVisitor
    {
        private readonly Func<Expression, Expression> replacer;

        public ExpressionReplacer(Func<Expression, Expression> replacer)
        {
            this.replacer = replacer;
        }

        public override Expression Visit(Expression node)
        {
            return base.Visit(replacer(node));
        }
    }
}
