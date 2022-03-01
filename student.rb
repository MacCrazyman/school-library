require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# leo = Student.new(16, 'hello', 'leonardo', false)
# p leo.classroom
# p leo.can_use_services?
# p leo.name
# p leo.age
# p leo.play_hooky
