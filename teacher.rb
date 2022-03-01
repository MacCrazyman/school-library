require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

leo = Teacher.new(16, 'Maths', 'leonardo')
p leo.can_use_services?
p leo.name
p leo.age
p leo.specialization
