# EXAMPLES FROM ADAM

require "date"
require "csv"

class Person
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  attr_accessor :name
  # def name
  #   @name
  # end
  #
  # def name=(value)
  #   @name = value
  # end

  attr_reader :birthday
  # def birthday
  #   @birthday
  # end

  attr_writer :lucky_number
  # def lucky_number=(value)
  #   @lucky_number = value
  # end

  def age
    (Time.now - birthday).years
  end

  def self.load(csv_filename)
    people = []

    CSV.foreach(csv_filename) do |row|
      people << Person.new(row[0], Date.parse(row[1]))
    end

    people
  end
end

p1 = Person.new("Bob", Date.new(1980, 10, 20))
p2 = Person.new("Alice", Date.new(1985, 4, 4))

p1.name #=> "Bob"
p1.name = "Adam"

people = Person.load("some_file.csv")

#
# Bob,1980-10-20
# Alice,1985-04-04
