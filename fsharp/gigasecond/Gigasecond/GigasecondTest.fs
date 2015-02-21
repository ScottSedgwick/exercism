module GigasecondTest

open NUnit.Framework
open Gigasecond

[<TestFixture>]
type GigasecondTest() =
    
    [<Test>]
    member tests.First_date() =
        let gigasecond = Gigasecond(System.DateTime(2011, 4, 25))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2043, 1, 1)))

    [<Test>]
    member tests.Another_date() =
        let gigasecond = Gigasecond(System.DateTime(1977, 6, 13))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2009, 2, 19)))

    [<Test>]
    member tests.Yet_another_date() =
        let gigasecond = Gigasecond(System.DateTime(1959, 7, 19))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(1991, 3, 27)))

    [<Test>]
    member tests.Scott() =
        let gigasecond = Gigasecond(System.DateTime(1968, 9, 23))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2000, 6, 1)))

    [<Test>]
    member tests.Meagen() =
        let gigasecond = Gigasecond(System.DateTime(1969, 10, 17))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2001, 6, 25)))

    [<Test>]
    member tests.Phoebe() =
        let gigasecond = Gigasecond(System.DateTime(2002, 2, 25))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2033, 11, 3)))

    [<Test>]
    member tests.Zoe() =
        let gigasecond = Gigasecond(System.DateTime(2004, 4, 18))
        Assert.That(gigasecond.Date, Is.EqualTo(System.DateTime(2035, 12, 26)))