module PigLatin

open System

let (|Prefix|_|) (p: string) (s: string) = 
    if s.StartsWith(p)
    then Some (s.Substring(p.Length))
    else None
    
let startLength(word : string) =
    match word with
    | Prefix "thr" _ -> 3
    | Prefix "sch" _ -> 3
    | Prefix "squ" _ -> 3
    | Prefix "ch"  _ -> 2
    | Prefix "th"  _ -> 2
    | Prefix "qu"  _ -> 2
    | _              -> 1

let startsWithVowel(word: string) = 
    match word with
    | Prefix "a"  _ -> true
    | Prefix "e"  _ -> true
    | Prefix "i"  _ -> true
    | Prefix "o"  _ -> true
    | Prefix "u"  _ -> true
    | Prefix "yt" _ -> true
    | Prefix "xr" _ -> true
    | _             -> false

let transformConsonant(word : string) =
    let headLen = startLength word
    word.Substring(headLen) + word.Substring(0, headLen)

let transformWord(word : string) =
    if startsWithVowel word
    then word
    else transformConsonant word

let translateWord(word : string) =
    transformWord word + "ay"

let join(words : string[]) : string =
    String.Join(" ", words)

let split(text: string) : string[] =
    text.Split [|' '|]

type PigLatin() =
    member this.translate(text : string) : string =
        text
        |> split 
        |> Array.map translateWord
        |> join
