require_relative '../lib/puzzle.rb'

describe "#intake" do

  it "retrieves 81 elements" do
    file = File.read("spec/fixtures/simple.sudoku")

    puzzle = Puzzle.new(file)

    expect(puzzle.intake.count).to eq 81
  end

  # regex constraint on file.scan already ensures below conditions
  # it "only contains integers" do
  # it "only contains values between 0 and 9" do
  
end

describe "#row_groups" do
  it "yields 9 rows of 9 elements each" do
    file = File.read("spec/fixtures/simple.sudoku")
    puzzle = Puzzle.new(file)
    intake_set = puzzle.intake

    row_count = puzzle.row_groups(intake_set).count
    # no need to verify nbr of elements within subarrays
    # as this is explicitly defined by the #each_slice method

    expect(row_count).to eq 9
  end
end

describe "#col_groups" do
  it "yields 9 cols of 9 elements each" do
    file = File.read("spec/fixtures/simple.sudoku")
    puzzle = Puzzle.new(file)
    intake_set = puzzle.intake

    col_count = puzzle.col_groups(intake_set).count

    expect(col_count).to eq 9
  end
end

describe "#gridlets" do
  it "yields 9 gridlets of 9 elements each" do
    file = File.read("spec/fixtures/simple.sudoku")
    puzzle = Puzzle.new(file)
    intake_set = puzzle.intake
    min = 10 # set higher than subarray count to initialize

    gridlet_count = puzzle.gridlets(intake_set).count
    # min_count = puzzle.gridlets(intake_set).each {|e| min = e.count if e.count < min}

    expect(gridlet_count).to eq 9
    # expect(min_count).to eq 9
  end

  it "returns the correct elements for the given sample" do
    file = File.read("spec/fixtures/simple.sudoku")
    puzzle = Puzzle.new(file)
    intake_set = puzzle.intake

    sample = puzzle.gridlets(intake_set)[4]

    expect(sample.join("")).to eq "444555666"
  end
end
