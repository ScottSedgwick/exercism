public class TwelveDaysSong
{
    private static string FIRST_LINE = "On the {0} day of Christmas my true love gave to me, ";
    private static string[] DAYS = { "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" };
    private static string[] LINES = 
    {
        "a Partridge in a Pear Tree.\n",
        "two Turtle Doves, and ",
        "three French Hens, ",
        "four Calling Birds, ",
        "five Gold Rings, ",
        "six Geese-a-Laying, ",
        "seven Swans-a-Swimming, ",
        "eight Maids-a-Milking, ",
        "nine Ladies Dancing, ",
        "ten Lords-a-Leaping, ",
        "eleven Pipers Piping, ",
        "twelve Drummers Drumming, "
    };

    public string Verse(int n)
    {
        string result = string.Format(FIRST_LINE, DAYS[n - 1]);
        for (int i = n - 1; i >= 0; i--)
        {
            result += LINES[i];
        }
        return result;
    }

    public string Verses(int start, int finish)
    {
        string result = "";
        for (int i = start; i <= finish; i++)
        {
            result += Verse(i) + "\n";
        }
        return result;
    }

    public string Sing()
    {
        return Verses(1, 12);
    }
}
