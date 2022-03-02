require './rental'
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals =[]
  end

  def add_rental(date,person)
    Rental.new(date, self, person)
  end
end
