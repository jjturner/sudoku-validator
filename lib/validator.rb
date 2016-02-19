require './lib/puzzle.rb'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    # below line will instantiate an instance and subsequently call
    # the 'validate' instance method on it.
    # --> so for all intents and purposes, this method is the
    # 'de facto' initializer/entry point for the class when invoked directly
    new(puzzle_string).validate
    return @rows
  end

  def validate
    # Start creating your solution here.
    #
    # It's likely that you'll want to have many more classes than this one that
    # was provided for you. Don't be hesistant to extract new objects (and
    # write tests for them).
    # puts @puzzle_string
    puzzle = Puzzle.new(@puzzle_string)
    @rows = puzzle.parse
    puts @rows[0]
  end
end
