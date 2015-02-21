using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class PrimeFactors
{
    public static long[] For(long value)
    {
        var result = new List<long>();
        var primes = new Primes();
        var temp = value;
        var index = 0;
        while (primes.Nth(index) <= temp)
        {
            var p = primes.Nth(index);
            while (temp % p == 0)
            {
                result.Add(p);
                temp = temp / p;
            }
            index++;
        }
        if (temp > 1) result.Add(temp);
        return result.ToArray();
    }
}

public class Primes
{
    private static List<long> _primes;

    public Primes()
    {
        _primes = new List<long> { 2, 3 };
    }

    public long Nth(int index)
    {
        if (index >= _primes.Count())
        {
            generate_next(index - _primes.Count + 1);
        }
        return _primes[index];
    }

    public int Count
    {
        get
        {
            return _primes.Count;
        }
    }

    private void generate_next(int count)
    {
        var candidate = _primes[_primes.Count - 1] + 2;
        for (var i = 0; i < count; i++)
        {
            while (!IsPrime(candidate)) candidate += 2;
            _primes.Add(candidate);
            candidate += 2;
        }
    }

    private static bool IsPrime(long candidate)
    {
        foreach (var p in _primes)
        {
            if (p > Math.Sqrt(candidate)) return true;
            if (candidate % p == 0) return false;
        }
        return true;
    }
}
