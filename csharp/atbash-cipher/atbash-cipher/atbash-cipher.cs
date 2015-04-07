using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Atbash
{
    public static string Encode(string words)
    {
        var cleartext = filter(words.ToLower());
        var ciphertext = encode_string(cleartext);
        var output = String.Join(" ", SplitByLength(ciphertext, 5));
        return output;
    }

    private static IEnumerable<int> numbers = Enumerable.Range('0', 10);
    private static IEnumerable<int> letters = Enumerable.Range('a', 26);
    private static IEnumerable<int> validChars = numbers.Concat(letters);

    private static char encode_char(char c)
    {
        if (numbers.Contains(c))
        {
            return c;
        }
        if (letters.Contains(c))
        {
            return (char) ((int)'z' - (int)c + (int)'a');
        }
        return ' ';
    }

    private static string encode_string(string s)
    {
        return new string(s.Select(c => encode_char(c)).ToArray());
    }

    private static string filter(string words)
    {
        return new string(words.Where(c => validChars.Contains(c)).ToArray());
    }

    private static IEnumerable<string> SplitByLength(string str, int maxLength)
    {
        for (int index = 0; index < str.Length; index += maxLength)
        {
            yield return str.Substring(index, Math.Min(maxLength, str.Length - index));
        }
    }
}
