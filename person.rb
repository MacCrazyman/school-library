require './corrector'
require './rental'
class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals
  

  def initialize(age, name = 'unknown', parent_permission = true)
    @corrector = Corrector.new
    @name = validate_name(name)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def validate_name(name)
    @corrector.correct_name(name)
  end

  # Method name `is_of_age` is marked as invalid by rubocop
  def of_age?
    @age >= 18
  end
end
