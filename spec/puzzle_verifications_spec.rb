require_relative '../lib/validator'

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
    
    expect(valid_cols).to eq true # e.g., col vals = ( 1..9 )
  end
end

describe "Validator#collate_tests" do
  it "returns true if all tests pass" do
    puzzle = Puzzle.new(File.read('spec/fixtures/valid_complete.sudoku'))

    pass = Validator.collate_tests(puzzle.groupings)

    expect(pass).to eq true
  end

  it "returns false if any tests fail" do
    puzzle = Puzzle.new(File.read('spec/fixtures/simple.sudoku'))

    pass = Validator.collate_tests(puzzle.groupings)

    expect(pass).to eq false
  end
end
