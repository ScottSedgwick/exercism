module Phrase

open System.Text.RegularExpressions

let rec replaceAll (s: string, old_str: string, new_str: string) =
    if s.Contains(old_str) then
        replaceAll (s.Replace(old_str, new_str), old_str, new_str)
    else
        s

let remove_trailing (s: string, remove: string): string = 
    if s.EndsWith(remove) then
        s.Substring(0, s.Length - remove.Length)
    else
        s

let singlespace (s:string) =
    remove_trailing(replaceAll (s, "  ", " "), " ")

let remove_single_quotes (s: string) = 
    let t1 = replaceAll (s, " '", " ")
    let t2 = replaceAll (t1, "' ", " ")
    remove_trailing(t2, "'")

let split_on_space (s:string) = s.Split[|' '|]

let remove_punctuation (s:string): string =
    Regex.Replace(s, "[,.:!@$%^&]", " ")
    

let preprocess(phrase: string) =
    phrase.ToLower()
    |> remove_punctuation
    |> remove_single_quotes
    |> singlespace
    |> split_on_space

type Phrase(phrase: string) = 
    member this.wordCount() = 
        phrase
        |> preprocess 
        |> Seq.groupBy id
        |> Seq.map (fun (word, sq) -> word, Seq.length sq)
        |> Map.ofSeq
