using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Media;
using System.Runtime.InteropServices;

public class Atbash
{
    public static string Encode(string words)
    {
        return String.Join(" ", SplitByLength(EncodeString(words), 5));
    }

    private static char EncodeChar(char c)
    {
        return (Char.IsDigit(c)) ? c : (char)('z' - c + 'a');
    }

    private static string EncodeString(string s)
    {
        return new string(s.ToLower().Where(Char.IsLetterOrDigit).Select(EncodeChar).ToArray());
    }

    private static IEnumerable<string> SplitByLength(IEnumerable<char> s, int len)
    {
        return s
            .Select((x, i) => new {Index = i, Value = x})
            .GroupBy(x => x.Index / len)
            .Select(x => new string(x.Select(v => v.Value).ToArray()));
    } 
}
