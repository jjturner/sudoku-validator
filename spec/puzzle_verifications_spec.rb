require_relative '../lib/validator.rb'

describe "Puzzle#incomplete" do
  it "returns true when puzzle contains a 0-value" do
    puzzle = Puzzle.new(File.read('spec/fixtures/valid_incomplete.sudoku'))

    expect(puzzle.incomplete).to eq true
  end
end

describe "Validator#verify_rows" do
  it "returns false if values are repeated" do
    puzzle = Puzzle.new(File.read('spec/fixtures/invalid_due_to_row_dupe.sudoku'))

    valid_rows = Validator.verify_rows(puzzle)
    
    expect(valid_rows).to eq false
  end
end
