module BeerSong

type BeerSong() =
    member private this.capitalize(line : string) =
        line.Substring(0,1).ToUpper() + line.Substring(1).ToLower()

    member this.bottles(count) =
        if (count = -1) then
            "99"
        elif (count = 0) then
            "no more"
        else
            sprintf "%d" count

    member this.multiple(count) = 
        if (count = 1) then
            ""
        else
            "s"

    member this.action(count) = 
        if (count = 0) then
            "go to the store and buy some more"
        else 
            let ptn = Printf.StringFormat<string->string>("take %s down and pass it around")
            if (count = 1) then
                sprintf ptn "it"
            else
                sprintf ptn "one"

    member this.verse(verseNum) = 
        let bottle = "bottle"
        let ofBeer = "of beer"
        let onWall = " on the wall"
        let ptn1 = Printf.StringFormat<string->string->string->string->string>("%s " + bottle + "%s " + ofBeer + onWall + ", %s " + bottle + "%s " + ofBeer + ".\n")
        let startBottles = this.bottles(verseNum)
        let startMult = this.multiple(verseNum)
        let ptn2 = Printf.StringFormat<string ->string->string->string>("%s, %s " + bottle + "%s " + ofBeer + onWall + ".\n")
        let action = this.action(verseNum)
        let endBottles = this.bottles(verseNum - 1)
        let endMult = this.multiple(verseNum - 1)
        let line1 = sprintf ptn1 startBottles startMult startBottles startMult |> this.capitalize
        let line2 = sprintf ptn2 action endBottles endMult |> this.capitalize
        line1 + line2
            
    member this.verses(fromLine, toLine) = 
        seq { fromLine .. -1 .. toLine } |>
        Seq.map this.verse |>
        Seq.reduce (sprintf "%s\n%s") |>
        sprintf "%s\n"

    member this.sing() = this.verses(99, 0)