module BinaryTests

open NUnit.Framework
open Binary

[<TestFixture>]
type BinaryTests() =
    
    [<TestCase("1", Result = 1, Ignore = false)>]
    [<TestCase("10", Result = 2, Ignore = false)>]
    [<TestCase("11", Result = 3, Ignore = false)>]
    [<TestCase("100", Result = 4, Ignore = false)>]
    [<TestCase("1001", Result = 9, Ignore = false)>]
    [<TestCase("11010", Result = 26, Ignore = false)>]
    [<TestCase("10001101000", Result = 1128, Ignore = false)>]
    member tests.Binary_converts_to_decimal(input) =
        Binary(input).toDecimal()

    [<TestCase("carrot", Ignore = false)>]
    [<TestCase("2", Ignore = false)>]
    [<TestCase("5", Ignore = false)>]
    [<TestCase("9", Ignore = false)>]
    [<TestCase("134678", Ignore = false)>]
    [<TestCase("abc10z", Ignore = false)>]
    member tests.Invalid_binary_is_decimal_0(input) =
        Assert.That(Binary(input).toDecimal(), Is.EqualTo(0))