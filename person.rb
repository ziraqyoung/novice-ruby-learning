# This class stores information about people
class Person #:nodoc: all
  attr_accessor :name, :age, :gender
  # Creates a person object and store their name
  def initialize(name)
    @name = name
  end

  # Prints the person name to the screen
  def print_name #:nodoc:
    print "Person is called #{@name}"
  end
end
