module OctalTests

open NUnit.Framework
open Octal

[<TestFixture>]
type OctalTests() =
    
    [<TestCase("1", Result = 1, Ignore = false)>]
    [<TestCase("10", Result = 8, Ignore = false)>]
    [<TestCase("17", Result = 15, Ignore = false)>]
    [<TestCase("11", Result = 9, Ignore = false)>]
    [<TestCase("130", Result = 88, Ignore = false)>]
    [<TestCase("2047", Result = 1063, Ignore = false)>]
    [<TestCase("7777", Result = 4095, Ignore = false)>]
    [<TestCase("1234567", Result = 342391, Ignore = false)>]
    member tests.Octal_converts_to_decimal(input) =
        Octal(input).toDecimal()

    [<TestCase("carrot", Ignore = false)>]
    [<TestCase("8", Ignore = false)>]
    [<TestCase("9", Ignore = false)>]
    [<TestCase("6789", Ignore = false)>]
    [<TestCase("abc1z", Ignore = false)>]
    member tests.Invalid_octal_is_decimal_0(input) =
        Assert.That(Octal(input).toDecimal(), Is.EqualTo(0))