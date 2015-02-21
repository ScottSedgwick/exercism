namespace BankAccount

type BankAccount() = 
    let mutable balance = None

    member this.Balance = balance

    member this.closeAccount() = 
        balance <- None

    member this.getBalance() = 
        match balance with
        | Some (x) -> x
        | None     -> 0.0
    
    member this.openAccount() = 
        balance <- Some 0.0
    
    member this.updateBalance(byAmount) = 
        balance <- Some (this.getBalance() + byAmount)
