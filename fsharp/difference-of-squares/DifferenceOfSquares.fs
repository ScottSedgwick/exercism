module DifferenceOfSquares

type DifferenceOfSquares(x) = 
  let range = seq { 1 .. x }
  let square x = pown x 2

  member this.squareOfSums() = 
    Seq.sum range
    |> square

  member this.sumOfSquares() =
    Seq.map square range 
    |> Seq.sum

  member this.difference() = 
    this.squareOfSums() - this.sumOfSquares()
