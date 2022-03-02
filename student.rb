require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

class1 = Classroom.new('class1')
p class1
leonardo = Student.new(18,class1, 'LeonardoPareja')
p leonardo
p class1