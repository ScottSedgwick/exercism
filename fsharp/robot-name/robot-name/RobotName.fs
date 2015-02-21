module RobotName

open System

let mutable nameSeed = 0

type RobotName() = 
    let mutable name = ""

    member private this.getChar(value) = 
        Convert.ToChar(value + 65)

    member private this.generateName() = 
        let l1  = (nameSeed / 26000) % 26 |> this.getChar
        let l2  = (nameSeed /  1000) % 26 |> this.getChar
        let num = nameSeed % 1000
        name <- sprintf "%c%c%03d" l1 l2 num
        nameSeed <- nameSeed + 1
        name

    member this.Name =
        if name = "" then this.generateName()
        else name

    member this.Reset() = 
        name <- ""
