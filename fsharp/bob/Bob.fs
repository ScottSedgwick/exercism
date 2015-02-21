module Bob

type Bob(msg) =
    let isSilent (s:string)   = s.Trim() = ""
    let hasLetters s          = String.exists System.Char.IsLetter s
    let isShouting s          = hasLetters s && s.ToUpper() = s
    let isQuestion (s:string) = s.EndsWith("?") 
    let otherwise _           = true
    let patterns = [|
        (isSilent,   "Fine. Be that way!");
        (isShouting, "Woah, chill out!");
        (isQuestion, "Sure.");
        (otherwise,  "Whatever.")
        |]

    member this.hey() =
        Array.find (fun (p,_) -> p msg) patterns |> snd
