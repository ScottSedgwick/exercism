using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class School
{
    private Dictionary<int, List<string>> roster = new Dictionary<int, List<string>>();

    public Dictionary<int, List<String>> Roster
    {
        get { return roster; }
    }

    public void Add(string name, int grade)
    {
        var g = Grade(grade);
        g.Add(name);
        g.Sort();
    }

    public List<string> Grade(int grade)
    {
        if (!roster.ContainsKey(grade)) {
            roster.Add(grade, new List<string>());
        }
        return roster[grade];
    }
}
