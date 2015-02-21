using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

public class Phrase
{
    private string phrase;

    public Phrase(string phrase)
    {
        this.phrase = Sanitize(phrase);
    }

    private string Sanitize(string phrase)
    {
        phrase = Regex.Replace(phrase.ToLower(), "[^a-z0-9 ']", " ");
        return Regex.Replace(phrase, "( '|' |^'|'$)", " ");
    }

    public Dictionary<string, int> WordCount()
    {
        var result = new Dictionary<string, int>();
        foreach (var word in this.phrase.Split(null as string[], StringSplitOptions.RemoveEmptyEntries))
        {
            result[word] = result.ContainsKey(word) ? result[word] + 1 : 1;
        }
        return result;
    }
}
