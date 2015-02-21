using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Anagram
{
    private string word;

    public Anagram(string word)
    {
        this.word = word.ToLower();
    }

    public IEnumerable<string> Match(string[] words)
    {
        return Enumerable.Where(words, isAnagram).OrderBy(s=>s);
    }

    private bool isAnagram(string word)
    {
        var w = word.ToLower();
        return (w != this.word) && w.OrderBy(c=>c).SequenceEqual(this.word.OrderBy(c=>c));
    }
}
