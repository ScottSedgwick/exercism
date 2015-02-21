namespace Binary

open System.Text.RegularExpressions

type Binary(input: string) = 
    member this.toDecimal() = Seq.fold (fun acc elem -> (acc * 2) + elem) 0 this.bits

    member private this.invalid = Regex.Match(input, @"[^0-1]").Success

    member private this.bits = if this.invalid
                               then Seq.empty
                               else Seq.map this.toBit input

    member private this.toBit(c) =
        match c with
            | '1'-> 1
            | _  -> 0
