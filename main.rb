require './app'

class Main
  def initialize
    @app = App.new
    @options = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_given_id,
      7 => :exit_program
    }
  end

  def start
    loop do
      display_menu
      option = gets.chomp.to_i
      handle_option(option)
    end
  end

  private

  def display_menu
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please select an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit..'
  end

  def handle_option(option)
    if @options.key?(option)
      send(@options[option])
    else
      puts 'Invalid option. Please select a valid option.'
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals_for_given_id
    @app.list_rentals_for_given_id
  end

  def exit_program
    puts 'Exiting...'
    exit
  end
end

Main.new.start
