module LeapYear

let inline (=%) number divisor =
    number % divisor = 0

type LeapYear() = 
    static member isLeap(year : int) = 
        year =% 400 || not (year =% 100) && year =% 4
