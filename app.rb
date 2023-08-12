require './person'
require './student'
require './book'
require './rental'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'No books available' if @books.empty?
    puts
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      puts
    end
  end

  def list_people
    puts 'No one has registered' if @people.empty?
    puts
    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      puts
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    if person_type == 1
      person = create_student
    elsif person_type == 2
      person = create_teacher
    else
      puts 'Invalid option'
      return
    end

    @people << person
    puts "#{person.class} created successfully"
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    permission = permission == 'y'
    Student.new(age, nil, name, parent_permission: permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def create_book
    puts
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts
    puts 'Book created successfully'
    puts
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    if valid_index?(book_index, person_index)
      rental = Rental.new(@people[person_index - 1], @books[book_index - 1], date)
      @rentals << rental
      puts 'Rental created successfully'
    else
      puts 'Invalid book or person index selected'
    end
  end

  def list_rentals_for_given_id
    print 'Enter ID: '
    id = gets.chomp.to_i
    list = []

    @rentals.each do |rental|
      list << "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end

    if list.empty?
      puts 'No record found for the selected person'
    else
      list.each { |rental| puts rental }
    end
  end

  private

  def valid_index?(book_index, person_index)
    book_index.between?(1, @books.length) && person_index.between?(1, @people.length)
  end
end
