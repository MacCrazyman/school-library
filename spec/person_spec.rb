require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new 24, 'Person 1', true
  end

  describe 'Check person age' do
    it 'return the person age ' do
      @person.age.should eql 24
    end
  end

  describe 'Check person age' do
    it 'return the person age ' do
      @person.age.should eql 24
    end
  end

  describe 'Check person name' do
    it 'return the person name ' do
      @person.name.should eql 'Person 1'
    end
  end

  describe 'Check person parent permission' do
    it 'return the person permission ' do
      expect(@person.can_use_services?).to be true
    end
  end
end