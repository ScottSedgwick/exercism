# Solution for Exercism Ruby Hello World problem.
class HelloWorld
  def self.hello(person = nil)
    person.nil? ? 'Hello, World!' : "Hello, #{person}!"
  end
end