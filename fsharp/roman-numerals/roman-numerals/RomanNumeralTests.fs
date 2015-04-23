module RomanNumeralTests

open NUnit.Framework
open RomanNumeral

[<TestFixture>]
type RomanNumeralTests() =
    
    [<TestCase(0, Result = "")>]
    [<TestCase(1, Result = "I", Ignore = false)>]
    [<TestCase(2, Result = "II", Ignore = false)>]
    [<TestCase(3, Result = "III", Ignore = false)>]
    [<TestCase(4, Result = "IV", Ignore = false)>]
    [<TestCase(5, Result = "V", Ignore = false)>]
    [<TestCase(6, Result = "VI", Ignore = false)>]
    [<TestCase(9, Result = "IX", Ignore = false)>]
    [<TestCase(27, Result = "XXVII", Ignore = false)>]
    [<TestCase(48, Result = "XLVIII", Ignore = false)>]
    [<TestCase(59, Result = "LIX", Ignore = false)>]
    [<TestCase(93, Result = "XCIII", Ignore = false)>]
    [<TestCase(141, Result = "CXLI", Ignore = false)>]
    [<TestCase(163, Result = "CLXIII", Ignore = false)>]
    [<TestCase(402, Result = "CDII", Ignore = false)>]
    [<TestCase(575, Result = "DLXXV", Ignore = false)>]
    [<TestCase(911, Result = "CMXI", Ignore = false)>]
    [<TestCase(1024, Result = "MXXIV", Ignore = false)>]
    [<TestCase(3000, Result = "MMM", Ignore = false)>]
    member tests.Convert_roman_to_arabic_numerals(arabicNumeral) =
        RomanNumeral().toRoman(arabicNumeral)