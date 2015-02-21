using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Binary
{
    private readonly IEnumerable<int> _bits;

    public Binary(string value)
    {
        var invalid = Regex.Match(value, @"[^0-1]").Success;
        _bits = invalid ? new int[0] : value.Select(v => v == '1' ? 1 : 0);
    }

    public int ToDecimal()
    {
        return _bits.Aggregate(0, (current, bit) => current*2 + bit);
    }
}
