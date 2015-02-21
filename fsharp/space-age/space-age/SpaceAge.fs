module SpaceAge

type Planet = 
    | Mercury
    | Venus 
    | Earth 
    | Mars 
    | Jupiter 
    | Saturn 
    | Uranus 
    | Neptune
    
let SecondsInOneEarthYear = 31557600m

let PlanetYearInSeconds = 
    Map.ofArray [| 
        (Mercury, SecondsInOneEarthYear * 0.2408467m);
        (Venus,   SecondsInOneEarthYear * 0.61519726m);
        (Earth,   SecondsInOneEarthYear * 1m);
        (Mars,    SecondsInOneEarthYear * 1.8808158m);
        (Jupiter, SecondsInOneEarthYear * 11.862615m);
        (Saturn,  SecondsInOneEarthYear * 29.447498m);
        (Uranus,  SecondsInOneEarthYear * 84.016846m);
        (Neptune, SecondsInOneEarthYear * 164.79132m);
    |]

let inYearsFor planet seconds =
    let planetYears = seconds / PlanetYearInSeconds.[planet]
    System.Math.Round(planetYears, 2)

type SpaceAge(seconds: decimal) =
    member this.Seconds()   = float(seconds)
    member this.onMercury() = seconds |> inYearsFor Mercury 
    member this.onVenus()   = seconds |> inYearsFor Venus 
    member this.onEarth()   = seconds |> inYearsFor Earth
    member this.onMars()    = seconds |> inYearsFor Mars
    member this.onJupiter() = seconds |> inYearsFor Jupiter
    member this.onSaturn()  = seconds |> inYearsFor Saturn
    member this.onUranus()  = seconds |> inYearsFor Uranus
    member this.onNeptune() = seconds |> inYearsFor Neptune
