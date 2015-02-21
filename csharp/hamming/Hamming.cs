using System;
using System.Linq;

public class Hamming
{
    public static int Compute(string dna1, string dna2)
    {
        return dna1.ToCharArray().Zip(dna2.ToCharArray(), (c1, c2) => (c1 == c2) ? 0 : 1).Sum();
    }
}
