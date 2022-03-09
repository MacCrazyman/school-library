require_relative 'spec_helper'

describe Rental do
  before :each do
    @person = Person.new 24, 'Person 1', true
    @book = Book.new 'title 1', 'author 1'
    @rental = Rental.new '03/09/2022', @book, @person
  end

  describe 'check instance' do
    it 'returns a rental instance' do
      @rental.should be_an_instance_of Rental
    end
  end

  describe 'check rental created in person instance' do
    it 'should return the rental from the person' do
      @person.rentals[0].should eql @rental
    end
  end

  describe 'check rental created in book instance' do
    it 'should return the rental from the book' do
      @book.rentals[0].should eql @rental
    end
  end

  describe 'check rental stored a person' do
    it 'should return the person instance' do
      @rental.person.should eql @person
    end
  end

  describe 'check rental stored a book' do
    it 'should return the book instance' do
      @rental.book.should eql @book
    end
  end
end
