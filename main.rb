require './app'

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
