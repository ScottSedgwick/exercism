using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class InvalidNucleotideException : Exception { }

public class DNA
{
    private Dictionary<char, int> genes = new Dictionary<char, int> { { 'A', 0 }, { 'T', 0 }, { 'C', 0 }, { 'G', 0 } };

    public DNA(string dna)
    {
        foreach (var c in dna)
        {
            Validate(c);
            genes[c] = genes[c] + 1;
        }
    }

    public Dictionary<char, int> NucleotideCounts
    {
        get { return genes; }
    }

    public int Count(char gene)
    {
        Validate(gene);
        return genes[gene];
    }

    private void Validate(char gene)
    {
        if (!genes.ContainsKey(gene))
        {
            throw new InvalidNucleotideException();
        }
    }
}
