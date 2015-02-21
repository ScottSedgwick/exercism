namespace Grains

type Grains() = 
    member this.twoTo (power) =
        1I <<< power

    member this.square(cell) =
        cell - 1 |> this.twoTo

    member this.total() =
        this.twoTo 64 - 1I
