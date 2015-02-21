module Triangle

type TriangleKind =
    | Equilateral
    | Isosceles
    | Scalene

type Triangle(a: decimal, b, c) = 
    let is_invalid = 
        a + b <= c || 
        a + c <= b || 
        b + c <= a

    do if is_invalid then 
        raise (System.InvalidOperationException("Triangle invalid"))

    let is_equilateral =
        a = b &&
        b = c

    let is_isosceles =
        a = b || 
        b = c || 
        a = c

    member this.Kind(): TriangleKind = 
        if is_equilateral then TriangleKind.Equilateral
        elif is_isosceles then TriangleKind.Isosceles
        else TriangleKind.Scalene