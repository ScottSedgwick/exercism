namespace Octal

open System

type Octal(input : String) = 
    let baseValue, maxChar = 8, '7'
    let minChar = '0'
    let source = input.ToCharArray()

    member this.toDecimal() = 
        if this.isNotValid() 
        then 0
        else Seq.fold (fun acc ch -> acc * baseValue + (this.charToInt ch)) 0 source

    member this.charToInt(c) = int (Math.Round (Char.GetNumericValue(c)))
    
    member this.isNotValid() = Seq.exists (fun c -> c < minChar || c > maxChar) source
