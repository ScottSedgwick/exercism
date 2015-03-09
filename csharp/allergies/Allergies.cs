using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Allergies
{
    private enum Allergen { eggs = 1, peanuts = 2, shellfish = 4, strawberries = 8, tomatoes = 16, chocolate = 32, pollen = 64, cats = 128 }
    private List<string> _allergies;
    private int _score;

    public Allergies(int score)
    {
        _score = score;
        _allergies = new List<string>();
        foreach (var value in Enum.GetValues(typeof(Allergen)))
        {
            if ((_score & (int)value) == (int)value)
            {
                _allergies.Add(value.ToString());
            }
        }
    }

    public bool AllergicTo(string allergen)
    {
        return _allergies.Contains(allergen);
    }

    public List<string> List()
    {
        return _allergies;
    }
}

