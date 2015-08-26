class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

p = Person.new('Kevin')
p.name # =>
p.age #  