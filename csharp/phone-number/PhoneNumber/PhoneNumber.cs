using System.Linq;

public class PhoneNumber
{
    private string _num = "0000000000";

    public PhoneNumber(string num)
    {
        string numbers = new string(num.Where(c => char.IsDigit(c)).ToArray());
        switch (numbers.Length)
        {
            case 10:
                _num = numbers;
                break;
            case 11:
                if (numbers.StartsWith("1")) { _num = numbers.Substring(1, 10); }
                break;
        }
    }

    public string Number
    {
        get { return _num; }
    }

    public string AreaCode
    {
        get { return _num.Substring(0, 3); }
    }

    public override string ToString()
    {
        return string.Format("({0}) {1}-{2}", AreaCode, _num.Substring(3, 3), _num.Substring(6, 4));
    }
}
