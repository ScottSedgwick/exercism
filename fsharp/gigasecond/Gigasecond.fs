module Gigasecond

let OneGS = System.TimeSpan(0, 0, 1000000000)

type Gigasecond(birthDate: System.DateTime) =
    member this.Date = birthDate.Add(OneGS).Date
