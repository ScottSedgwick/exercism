EARTH_SECS = 31_557_600
YEAR_LENGTH = {
  'earth'   => EARTH_SECS * 1.0,
  'mercury' => EARTH_SECS * 0.2408467,
  'venus'   => EARTH_SECS * 0.61519726,
  'mars'    => EARTH_SECS * 1.8808158,
  'jupiter' => EARTH_SECS * 11.862615,
  'saturn'  => EARTH_SECS * 29.447498,
  'uranus'  => EARTH_SECS * 84.016846,
  'neptune' => EARTH_SECS * 164.79132
}

# Solution for Exercism.io Ruby Space Age problem.
class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(method_sym, *arguments, &block)
    if method_sym.to_s =~ /^on_(.*)$/
      planet = Regexp.last_match[1].to_s
      if YEAR_LENGTH.key? planet
        age_on planet
      else
        super
      end
    else
      super
    end
  end

  :private

  def age_on(planet)
    (@seconds * 100.0 / YEAR_LENGTH[planet]).round / 100.0
  end
end
