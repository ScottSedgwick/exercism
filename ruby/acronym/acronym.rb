# Acronym: solution for exercism exercise.
class Acronym
  def self.abbreviate(longform)
    words = longform.gsub(/([a-z])([A-Z])/, '\1 \2').split(/\W+/)
    words.map { |s| s[0] }.join('').upcase
  end
end
