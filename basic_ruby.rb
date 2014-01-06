# Project 7


# 1. Create a ruby class that uses “class variables” and “instance variables” how are these two different?
# a ruby class that uses “class variables”
class Polygon
  @@sides = 10
  def self.sides
    @@sides
  end
end

puts Polygon.sides  # => 10
# a ruby class that uses "instance variable"
class Triangle
  @sides = 3
  def self.sides
    @sides
  end
end

puts Triangle.sides # => 3
# "class variable" and "instance variable" are different because:
# "class variable" is prefixed with the double @ signes (@@), particularly useful for storing information relevant to all objects of a certain class.
# "instance variable" is prefixed with a simple @ signe, and is what we use to store attributes inside instances 



# 2. Create a ruby class that uses “class methods” and “instance methods” how are these two different?
# a ruby class that uses "class methods"
class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end
  def Square.count
    @@number_of_squares
  end
end

a = Square.new
puts Square.count
b = Square.new
puts Square.count
c = Square.new
puts Square.count
# a ruby class that uses "instance methods"
class Animal
  def noise=(noise)
    @noise = noise
  end
  
  def noise
    @noise
  end
end

animal = Animal.new
animal.noise = "woof!"
puts animal.noise

animal2 = Animal.new
animal2.noise = "Miaww!"
puts animal2.noise
# These 2 are different because the class method is denoted with self., where self  represents the current class. However, with no prefix, methods are automatically instance methods.


# 3. Create a class that implements a “private” method. Why use private methods?
# a class that implements a "private" method
class Person
  def initialize(name)
    set_name(name)
  end
  
  def name
    @first_name + ' ' + @last_name
  end
  
  private
  
  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end
  
  def set_first_name(name)
    @first_name = name
  end
  
  def set_last_name(name)
    @last_name = name
  end
end

puts Person.new("Naly Rama")
# You use private Methode to tell Ruby that any methods declared within the object’s methods can access to the private methods,and are not visible. whereas code outside of the class cannot, and are still visible by default.


# 4. Create a class that implements a “protected” methods. Why use protected methods?
class Person
  def initialize(age)
    @age = age
  end
  
  def age
    @age
  end
  
  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end
  
  protected :age
end

sedy = Person.new(26)
tahiry = Person.new(24)
puts tahiry.age_difference_with(sedy)
puts tahiry.age # => basic_ruby.rb:123:in `<main>': protected method `age' called for #<Person:0x007fbafb024640 @age=24> (NoMethodError)
# you use protected methode to make a method private, but within the scope of a class rather than within a single object. For example, you were unable to directly call a private method outside the scope of that object and its methods. However, you can call a protected method from the scope of the methods of any object that’s a member of the same class, within any method belonging to an object of the Person class.


# 6. Create 3 classes. They should be named “Vehicle”, “Car”, “Truck”. Car and Truck should “inherit” from “Vehicle”
class Vehicle
  def category
    puts "sports vehicles"
  end
  def Name
    puts "Buffalo"
  end
end

class Car < Vehicle
  def Name
    puts "Ford"
  end
end

class Truck < Vehicle
  def Name
    puts "Rodgline"
  end
end
  
car = Car.new
car.category
car.Name

truck = Truck.new
truck.category
truck.Name



# 7. Create a method in Vehicle and then “override” it in Car and Truck. Why would you override methods?
class Vehicle
  def type
    puts "Automobile"
  end
  def Name
    puts "Jeep"
  end
end

class Car < Vehicle
  def Name
    puts "Compass"
  end
end

class Truck < Vehicle
  def Name
    puts "Grand Cherokee"
  end
end
  
car = Car.new
car.type # => Automobile
car.Name # => Chevrolet

truck = Truck.new
truck.type # Automobile
truck.Name # => Jeep


# You override a methods to allow a subclass to provide a specific implementation of a method that is already provided by one of its superclasses. The implementation in the subclass overrides or replaces the implementation in the superclass.



# 8. Show an example of using “super” in your overrided methods. Why use super?
class Vehicle
  def type
    puts "Automobile"
  end
  def Name
    puts "Jeep"
  end
end

class Car < Vehicle
  def Name
    super
    puts "Compass"
  end
end

class Truck < Vehicle
  def Name
    puts "Grand Cherokee"
  end
end
  
car = Car.new
car.type # => Automobile
car.Name # => Jeep
         #    Compass

truck = Truck.new
truck.type # Automobile
truck.Name # => Grand Cherokee

# When you invoke super with no arguments Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called.


