using System;
using System.Collections.Generic;
using System.Linq;

public class SumOfMultiples
{
    private List<int> factors;

    public SumOfMultiples() : this(new List<int> { 3, 5 }) { }

    public SumOfMultiples(List<int> factors)
    {
        this.factors = factors;
    }

    public int To(int upTo)
    {
        var multiples = new HashSet<int>();
        factors.ForEach(delegate(int factor) 
        { 
            multiples.UnionWith(MultiplesToFor(upTo, factor)); 
        });
        return multiples.Sum<int>(x => x);
    }

    private IEnumerable<int> MultiplesToFor(int upTo, int factor)
    {
        var mcount = (int) Math.Ceiling((double) upTo / factor) - 1;
        return Enumerable.Range(1, mcount).Select(i => i * factor);
    }
}
