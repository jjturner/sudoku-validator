require_relative '../lib/validator.rb'

describe "Puzzle#incomplete" do
  it "returns true when puzzle contains a 0-value" do
    puzzle = Puzzle.new(File.read('spec/fixtures/valid_incomplete.sudoku'))

    expect(puzzle.incomplete).to eq true
  end
end

describe "Validator#verify" do
  it "returns false if values are repeated" do
    puzzle = Puzzle.new(File.read('spec/fixtures/invalid_due_to_row_dupe.sudoku'))

    valid_rows = Validator.verify(puzzle.row_groups)
    
    expect(valid_rows).to eq false
  end

  it "returns true if values are unique" do
    puzzle = Puzzle.new(File.read('spec/fixtures/simple.sudoku'))

    valid_cols = Validator.verify(puzzle.col_groups)
    
    expect(valid_cols).to eq true # e.g., col vals = 1,2,3,4,5,6,7,8,9
  end
end
