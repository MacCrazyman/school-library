require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new :classroom
    @student = Student.new 24, @classroom, 'Student 1', true
  end

  describe 'Creating a new instance' do
    it 'return a new classroom object' do
      @classroom.should be_an_instance_of Classroom
    end
  end

  describe 'Check student classroom' do
    it 'returns the classroom label' do
      @classroom.label.should eql :classroom
    end
  end

  describe 'Check whether classroom have student' do
    it 'return student number' do
      @classroom.students.length.should eql 1
    end
  end

  describe 'Check the student in the classroom' do
    it 'return student in that classroom' do
      @classroom.students[0].should eql @student
    end
  end
end
