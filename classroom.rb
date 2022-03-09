class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def to_s
    @label.to_s
  end

  def add_student(student)
    return if @students.include?(student)

    @students << student
    student.classroom = self
  end
end
