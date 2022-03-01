class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || parent_permission
  end

  private

  # Method of name `is_of_age` is marked as invalid by rubocop
  def of_age?
    @age >= 18
  end
end

# leo = Person.new 20, 'Leonardo'
# p leo.can_use_services?
# p leo.name
# p leo.age
# p leo.id
