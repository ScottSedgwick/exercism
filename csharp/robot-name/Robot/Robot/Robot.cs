using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Robot 
{
    private string _name;
    private static Random _random = new Random((int)DateTime.Now.Ticks);
    private static HashSet<string> _names = new HashSet<string>();

    public Robot()
    {
        Reset();
    }

    public string Name
    {
        get
        {
            return _name;
        }
    }

    public void Reset()
    {
        do 
        {
            _name = GenerateName();
        }
        while (! _names.Add(_name));
    }

    private string GenerateName()
    {
        return new StringBuilder()
            .Append(RandomChars(2))
            .Append(RandomInt(1000).ToString())
            .ToString();
    }

    private char[] RandomChars(int length)
    {
        return new Char[length]
            .Select(_ => Convert.ToChar(RandomInt(26) + 65))
            .ToArray();
    }

    private int RandomInt(int UpTo) 
    {
        return Convert.ToInt32(
            Math.Floor(UpTo * _random.NextDouble()));
    }
}
