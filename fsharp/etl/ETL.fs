namespace ETL

type ETL() = 
    member this.transform(old) = 
        [for KeyValue(k, vs) in old do
           for v in vs do 
             yield v.ToString().ToLower(), k]
        |> Map.ofSeq
