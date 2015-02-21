using System;
using System.Collections.Generic;

public class ETL
{
    public static Dictionary<string, int> Transform(Dictionary<int, IList<string>> oldTable)
    {
        var newTable = new Dictionary<string, int>();
        foreach (var entry in oldTable)
        {
            foreach (var letter in entry.Value)
            {
                newTable.Add(letter.ToLower(), entry.Key);
            }
        }
        return newTable;
    }
}

