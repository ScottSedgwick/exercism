using System;
using System.Collections.Generic;

public class SpaceAge
{
    private Int64 seconds;
    private enum Planets {Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune}
    private Dictionary<Planets, Int64> secs_in_year = new Dictionary<Planets, Int64>();

    public SpaceAge(Int64 seconds)
    {
        this.seconds = seconds;
        this.secs_in_year[Planets.Earth] = 31557600;
        this.secs_in_year[Planets.Mercury] = (Int64)Math.Round(31557600 * 0.2408467);
        this.secs_in_year[Planets.Venus]   = (Int64)Math.Round(31557600 * 0.61519726);
        this.secs_in_year[Planets.Mars]    = (Int64)Math.Round(31557600 * 1.8808158);
        this.secs_in_year[Planets.Jupiter] = (Int64)Math.Round(31557600 * 11.862615);
        this.secs_in_year[Planets.Saturn]  = (Int64)Math.Round(31557600 * 29.447498);
        this.secs_in_year[Planets.Uranus]  = (Int64)Math.Round(31557600 * 84.016846);
        this.secs_in_year[Planets.Neptune] = (Int64)Math.Round(31557600 * 164.79132);
    }

    public Int64 Seconds
    {
        get
        {
            return this.seconds;
        }
    }

    private float toYears(Planets forPlanet)
    {
        return (float)this.seconds / secs_in_year[forPlanet];
    }

    public float OnMercury()
    {
        return toYears(Planets.Mercury);
    }

    public float OnVenus()
    {
        return toYears(Planets.Venus);
    }

    public float OnEarth()
    {
        return toYears(Planets.Earth);
    }

    public float OnMars()
    {
        return toYears(Planets.Mars);
    }

    public float OnJupiter()
    {
        return toYears(Planets.Jupiter);
    }

    public float OnSaturn()
    {
        return toYears(Planets.Saturn);
    }

    public float OnUranus()
    {
        return toYears(Planets.Uranus);
    }

    public float OnNeptune()
    {
        return toYears(Planets.Neptune);
    }
}
