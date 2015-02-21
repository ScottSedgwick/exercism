using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Bob
{
    private bool isSilence(String statement)
    {
        return (statement.Trim() == "");
    }

    private bool isShouting(String statement)
    {
        return ((statement.Any(x => char.IsLetter(x))) && (statement.ToUpper() == statement));
    }

    private bool isQuestion(String statement)
    {
        return (statement.EndsWith("?"));
    }

    public String Hey(String statement)
    {
        if (isSilence(statement)) return "Fine. Be that way!";
        if (isShouting(statement)) return "Whoa, chill out!";
        if (isQuestion(statement)) return "Sure.";
        return "Whatever.";
    }
}
