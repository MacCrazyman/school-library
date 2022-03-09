require_relative 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new :classroom
    @student = Student.new 24, @classroom, 'Student 1', true
  end

  describe 'Check student age' do
    it 'return the student age ' do
      @student.age.should eql 24
    end
  end

  describe 'Check student name' do
    it 'return the student name ' do
      @student.name.should eql 'Student 1'
    end
  end

  describe 'Check student parent permission' do
    it 'return the student permission ' do
      expect(@student.can_use_services?).to be true
    end
  end

  describe 'Check student classroom' do
    it 'returns the classroom label' do
      @student.classroom.label.should eql :classroom
    end
  end
end
