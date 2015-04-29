using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Atbash
{
    public static string Encode(string words)
    {
        return String.Join(" ", SplitByLength(EncodeString(words), 5));
    }

    private static readonly IEnumerable<int> Numbers = Enumerable.Range('0', 10);
    private static readonly IEnumerable<int> Letters = Enumerable.Range('a', 26);
    private static readonly IEnumerable<int> ValidChars = Numbers.Concat(Letters);

    private static char EncodeChar(char c)
    {
        return (Numbers.Contains(c)) ? c : (char)('z' - c + 'a');
    }

    private static string EncodeString(string s)
    {
        return new string(Filter(s).Select(EncodeChar).ToArray());
    }

    private static string Filter(string words)
    {
        return new string(words.ToLower().Where(c => ValidChars.Contains(c)).ToArray());
    }

    private static IEnumerable<string> SplitByLength(string str, int maxLength)
    {
        for (var index = 0; index < str.Length; index += maxLength)
        {
            yield return str.Substring(index, Math.Min(maxLength, str.Length - index));
        }
    }
}
