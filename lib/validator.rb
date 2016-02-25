require_relative '../lib/puzzle'
require_relative '../lib/output'
include Output

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

  end

  def validate
    # Start creating your solution here.
    #
    # It's likely that you'll want to have many more classes than this one that
    # was provided for you. Don't be hesistant to extract new objects (and
    # write tests for them).
    puzzle = Puzzle.new(@puzzle_string)
    valid = Validator.collate_tests(puzzle.groupings)
    message(valid)
  end

  def self.collate_tests(groupings)
    groupings.each do |grouping|
      test_result = verify(grouping)
      return false if !test_result 
    end
    true
  end

  def self.verify(grouping)
    grouping.each do |e|
      condensed = e - [0]
      return false if condensed != condensed.uniq
    end
    true
  end
end
