class Rental
  attr_accessor :date

  def initialize(person, book, date)
    @date = date

    @book = book
    @book.rentals << self

    @person = person
    @person.rentals << self
  end
end
