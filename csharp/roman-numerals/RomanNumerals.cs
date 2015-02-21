using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public static class ExtensionMethods
{
    public static string ToRoman(this int value)
    {
        var numerals = new Dictionary<int, string>() 
        {
            {1000, "M"},
            {900, "CM"},
            {500, "D"},
            {400, "CD"},
            {100, "C"},
            {90, "XC"},
            {50, "L"},
            {40, "XL"},
            {10, "X"},
            {9, "IX"},
            {5, "V"},
            {4, "IV"},
            {1, "I"}
        };
        string result = "";
        int temp = value;
        
        foreach (var pair in numerals) 
        {
            while (temp >= pair.Key) 
            {
                result += pair.Value;
                temp -= pair.Key;
            }
        }
        
        return result;
    }
}