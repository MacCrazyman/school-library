class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_s
    "[Rental] - Date: #{@date} | Book: #{@book} | Person: #{@person}"
  end

end
