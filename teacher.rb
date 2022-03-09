require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def to_s
    "[Teacher] - Name: #{@name} | Age: #{@age} | Specialization: #{@specialization}"
  end

  def to_json
    {"name": @name, "age": @age, "type": "teacher", "specialization": @specialization}
  end

  def can_use_services?
    true
  end
end
