namespace RomanNumeral

type RomanNumeral() = 
    let numbers = 
        Map.empty
            .Add(1000, "M")
            .Add(900, "CM")
            .Add(500, "D")
            .Add(400, "CD")
            .Add(100, "C")
            .Add(90, "XC")
            .Add(50, "L")
            .Add(40, "XL")
            .Add(10, "X")
            .Add(9, "IX")
            .Add(5, "V")
            .Add(4, "IV")
            .Add(1, "I")
    let keys = numbers |> Map.toSeq |> Seq.map fst |> Seq.sortBy (fun x -> -x - 1) |> Seq.toList

    member this.toRoman(value: int) =
        this.addNumerals(value, 0)

    member private this.addNumerals(value: int, keyidx: int) =
        if (keyidx >= keys.Length)
        then ""
        else if (value >= keys.[keyidx])
             then (numbers.[keys.[keyidx]] + this.addNumerals(value - keys.[keyidx], keyidx))
             else this.addNumerals(value, keyidx + 1)