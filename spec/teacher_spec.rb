require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new 24, 'maths', 'Teacher 1', false
  end

  describe 'Check teacher age' do
    it 'return the teacher age ' do
      @teacher.age.should eql 24
    end
  end

  describe 'Check teacher name' do
    it 'return the teacher name ' do
      @teacher.name.should eql 'Teacher 1'
    end
  end

  describe 'Check teacher permission to use services' do
    it 'return true always ' do
      expect(@teacher.can_use_services?).to be true
    end
  end

  describe 'Check teacher specialization' do
    it 'returns the specialization string' do
      @teacher.specialization.should eql 'maths'
    end
  end
end
