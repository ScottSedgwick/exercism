# Solution for Exercism Clock exercise.
class Clock
  def self.at(h, m = 0)
    Time.new(h, m)
  end
end

# Helper class fo Clock
class Time
  attr_accessor :hours, :minutes
  def initialize(h, m)
    @hours = h
    @minutes = m
  end

  def +(other)
    @minutes += other
    @hours = (@hours + @minutes / 60) % 24
    @minutes = @minutes % 60
    self
  end

  def -(other)
    self + (other * -1)
  end

  def ==(other)
    (@hours == other.hours) && (@minutes == other.minutes)
  end

  def to_s
    format '%02d:%02d', @hours, @minutes
  end
end
