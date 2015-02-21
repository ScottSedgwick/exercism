module SumOfMultiples

type SumOfMultiples(x: int list) =
  let isMultipleOfFactor value =
    Seq.exists (fun f -> (value % f) = 0) x
    
  member this.To y = 
    seq { 0 .. max (y - 1) 0 } 
    |> Seq.filter isMultipleOfFactor 
    |> Seq.sum
  
  new() = SumOfMultiples([3; 5])
