module TrinaryTests

open NUnit.Framework
open Trinary

[<TestFixture>]
type TrinaryTests() =
    
    [<TestCase("1", Result = 1, Ignore = false)>]
    [<TestCase("2", Result = 2, Ignore = false)>]
    [<TestCase("10", Result = 3, Ignore = false)>]
    [<TestCase("11", Result = 4, Ignore = false)>]
    [<TestCase("100", Result = 9, Ignore = false)>]
    [<TestCase("112", Result = 14, Ignore = false)>]
    [<TestCase("222", Result = 26, Ignore = false)>]
    [<TestCase("1122000120", Result = 32091, Ignore = false)>]
    member tests.Binary_converts_to_decimal(input) =
        Trinary(input).toDecimal()

    [<TestCase("carrot", Ignore = false)>]
    [<TestCase("3", Ignore = false)>]
    [<TestCase("6", Ignore = false)>]
    [<TestCase("9", Ignore = false)>]
    [<TestCase("124578", Ignore = false)>]
    [<TestCase("abc1z", Ignore = false)>]
    member tests.Invalid_binary_is_decimal_0(input) =
        Assert.That(Trinary(input).toDecimal(), Is.EqualTo(0))