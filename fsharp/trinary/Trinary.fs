module Trinary

open System.Text.RegularExpressions

type BaseConvert(nBase: int, value: string) =
    member this.digits = if this.valid(value) then [for c in value -> this.ctoi(c)] else []

    member this.toDecimal() = List.fold (fun acc digit -> acc * nBase + digit) 0 this.digits

    member this.ctoi(c) = int(c) - int('0')

    member this.valid(value) = not (Regex.Match(value, @"[^0-" + (string)(nBase - 1) + "]").Success)


type Trinary(value: string) = 
    member this.toDecimal() = (new BaseConvert(3, value)).toDecimal()
    