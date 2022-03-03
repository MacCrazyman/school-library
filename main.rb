#!/usr/bin/env ruby
class App
  attr_accessor :books, :people, :rentals
  def initialize
    @books = ['book 1', 'book 2']
    @people = ['person 1', 'person 2']
    @rentals = [' rental 1', 'rental 2']
  end

  def create_person
  end
  def create_book
  end
  def create_rental
  end
  def list_books
    puts @books
  end
  def list_people
    puts 'world'
  end
  def list_rentals
  end
end
def main
  app = App.new()
  main_text = ['Please chooshe an option by enterin a number',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Exit']
  functions = {
    '1' => -> {app.list_books()},
    '2' => -> {app.list_people()},
    '3' => -> {app.create_person()},
    '4' => -> {app.create_book()},
    '5' => -> {app.create_rental()},
    '6' => -> {app.list_rentals()},
    '7' => -> {puts 'Thanks for using the service'}
  }
  execution = nil

  while execution != '7'
    puts main_text
    execution = gets.chomp
    functions[execution].()
  end
  
end

main()