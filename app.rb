require './book'
require './classroom'
require './rental'
require './student'
require './teacher'
require 'date'
require 'json'
require 'pry'

class App
  attr_accessor :books, :people, :rentals
  attr_reader :main_text, :functions

  def initialize
    @books = []
    @people = []
    @rentals = []
    @class1 = Classroom.new('class 1')
    check_books_and_people
    check_rentals
    @functions = {
      1 => -> { list_books },
      2 => -> { list_people },
      3 => -> { create_person },
      4 => -> { create_book },
      5 => -> { create_rental },
      6 => -> { list_rentals },
      7 => -> { store_data }
    }
  end

  def store_data
    File.write('./book.json', JSON.pretty_generate(@books.map(&:to_json)))

    File.write('./person.json', JSON.pretty_generate(@people.map(&:to_json)))

    File.write('./rentals.json', JSON.pretty_generate(@rentals.map(&:to_json)))

    puts 'Thanks for using the service'
  end

  def check_books_and_people
    if File.exist?('./book.json')
      JSON.parse(File.read('./book.json')).each { |book| @books << Book.new(book['title'], book['author']) }
    end

    return unless File.exist?('./person.json')

    JSON.parse(File.read('./person.json')).each do |person|
      if person['type'] == 'student'
        @people << Student.new(person['age'], @class1, person['name'],
                               person['parent_permission'])
      end
      @people << Teacher.new(person['age'], person['specialization'], person['name']) if person['type'] == 'teacher'
    end
  end

  def check_rentals
    return unless File.exist?('./rentals.json')

    JSON.parse(File.read('./rentals.json')).each do |rental|
      @rentals << Rental.new(rental['date'], @books.select do |book|
                                               rental_title = rental['book']['title']
                                               rental_author = rental['book']['author']
                                               book.title == rental_title && book.author == rental_author
                                             end [0], @people.select do |person|
                                                        rental_name = rental['person']['name']
                                                        rental_age = rental['person']['age']
                                                        person.name == rental_name && person.age == rental_age
                                                      end [0])
    end
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

    @rentals << Rental.new(DateTime.now, @books[book_id], @people[person_id])
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
