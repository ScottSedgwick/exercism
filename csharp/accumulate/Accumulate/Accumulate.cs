using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public static class MyExtensions
{
    public static IEnumerable<T> Accumulate<T>(this IEnumerable<T> values, Func<T,T> f)
    {
        foreach (var v in values)
        {
            yield return f(v);
        }
    }
}
