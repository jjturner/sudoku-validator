require_relative '../lib/validator.rb'

describe "Puzzle#incomplete" do
  it "returns true when puzzle contains a 0-value" do
    puzzle = Puzzle.new(File.read('spec/fixtures/valid_incomplete.sudoku'))
    puzzle_vals = puzzle.consume

    expect(puzzle.incomplete(puzzle_vals)).to eq true
  end
end
