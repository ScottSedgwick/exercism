using System;

public enum TriangleKind
{
    Equilateral,
    Isosceles,
    Scalene
}

public class TriangleException : Exception
{
}
 
public class Triangle
{
    private readonly Decimal[] _sides;

    public Triangle(Decimal a, Decimal b, Decimal c)
    {
        _sides = new Decimal[] { a, b, c };
        Array.Sort(_sides);
    }
    
    public TriangleKind Kind()
    {
        if (_sides[2] >= (_sides[0] + _sides[1]))
        {
            throw new TriangleException();
        }
        if (_sides[0] == _sides[1])
        {
            return _sides[1] == _sides[2] ? TriangleKind.Equilateral : TriangleKind.Isosceles;
        }
        return _sides[1] == _sides[2] ? TriangleKind.Isosceles : TriangleKind.Scalene;
    }
}
