namespace Hamming

type Hamming() = 
    member x.compute(dna1, dna2) = 
        Seq.zip dna1 dna2 |>
        Seq.map (fun (gene1, gene2) -> if (gene1 = gene2) then 0 else 1) |>
        Seq.sum