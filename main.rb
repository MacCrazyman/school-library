require './book'
require './classroom'
require './rental'
require './student'
require './teacher'
require 'date'

class App
  attr_accessor :books, :people, :rentals
  attr_reader :main_text, :functions

  def initialize
    @books = []
    @people = []
    @rentals = []
    @class1 = Classroom.new('class 1')
    @functions = {
      1 => -> { list_books },
      2 => -> { list_people },
      3 => -> { create_person },
      4 => -> { create_book },
      5 => -> { create_rental },
      6 => -> { list_rentals },
      7 => -> { puts 'Thanks for using the service' }
    }
  end

  def create_person
    print 'Plase choose one option (1) for student / (2) for teacher: '
    person_type = gets.chomp
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp
    if person_type == '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      @people << Student.new(person_age, @class1, person_name, permission)
    end
    if person_type == '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(person_age, specialization, person_name)
    end
    print " \n ---------- \n Person created \n ---------- \n \n "
  end

  def create_book
    print 'Book title: '
    book_title = gets.chomp
    print 'Book author: '
    book_author = gets.chomp
    @books << Book.new(book_title, book_author)
    print " \n ---------- \n Book created \n ---------- \n \n "
  end

  def create_rental
    print "Select one book from the following list: \n"
    @books.each_with_index { |book, index| print "#{index} ) - #{book.title} \n" }
    book_id = gets.chomp.to_i
    print "Select a person from the list: \n"
    @people.each_with_index { |person, index| print "#{index} ) - #{person.name} \n" }
    person_id = gets.chomp.to_i

    @rentals << Rental.new(DateTime.now, @books[book_id], @people[person_id].name)
    print " \n ---------- \n Rental created \n ---------- \n \n "
  end

  def list_books
    puts @books
  end

  def list_people
    puts @people
  end

  def list_rentals
    print "Select a person from the list: \n"
    @people.each_with_index { |person, index| print "#{index} ) - #{person.name} \n" }
    person_id = gets.chomp.to_i
    puts(@rentals.select { |rental| rental.person == @people[person_id] })
  end
end

def main
  main_text = ['Please chooshe an option by enterin a number',
               '1 - List all books',
               '2 - List all people',
               '3 - Create a person',
               '4 - Create a book',
               '5 - Create a rental',
               '6 - List all rentals for a given person id',
               '7 - Exit']
  app = App.new
  execution = nil

  while execution != 7
    puts main_text
    execution = gets.chomp.to_i
    app.functions[execution].call if execution.between?(1, 7)
  end
end

main
