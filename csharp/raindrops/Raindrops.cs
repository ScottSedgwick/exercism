using System;
using System.Collections.Generic;
using System.Linq;

public class Raindrops
{
    private static bool DivisibleBy(int number, int divisor)
    {
        return (number % divisor) == 0;
    }

    private static readonly Dictionary<int, string> _sounds = new Dictionary<int, string>
    {
        { 3, "Pling" },
        { 5, "Plang" },
        { 7, "Plong" }
    };

    public static string Convert(int number)
    {
        var result = string.Join("", _sounds.Keys.Select(k => DivisibleBy(number, k) ? _sounds[k] : "" ));
        return (result == "") ? number.ToString() : result;
    }
}
