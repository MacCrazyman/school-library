class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def to_s
    "#{@label}"
  end

  def add_student(student)
    return if @students.include?(student)

    @students << student
    student.classroom = self
  end
end
