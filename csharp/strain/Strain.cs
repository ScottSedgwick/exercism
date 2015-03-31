using System;
using System.Collections.Generic;
using System.Linq;

public static class Strain
{
    public static IEnumerable<T> Keep<T>(this IEnumerable<T> coll, Func<T, bool> func)
    {
        return coll.Where(func);
    }

    public static IEnumerable<T> Discard<T>(this IEnumerable<T> coll, Func<T, bool> func)
    {
        return coll.Keep(x => !func(x));
    }
}
