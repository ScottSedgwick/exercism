using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Gigasecond
{
    private DateTime birthday;
    private static int DAYS_IN_GS = 11574;

    public Gigasecond(DateTime birthday)
    {
        this.birthday = birthday;
    }

    public DateTime Date()
    {
        return this.birthday.AddDays(DAYS_IN_GS);
    }
}
