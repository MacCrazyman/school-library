require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    classroom.add_student(self)
  end

  def to_s
    "[Student] - Name: #{@name} | Age: #{@age} | Classroom: #{@classroom}"
  end

  def to_json
    {"name": @name, "age": @age, "parent_permission": @parent_permission, "type": "student"}
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
