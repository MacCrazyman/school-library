require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'title 1', 'author 1'
  end

  describe 'creating a new instance' do
    it 'return a new Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe 'checking the title' do
    it 'returns the rigth title' do
      @book.title.should eql 'title 1'
    end
  end

  describe 'checking the author' do
    it 'returns the rigth author' do
      @book.author.should eql 'author 1'
    end
  end
end
