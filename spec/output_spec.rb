require_relative '../lib/output'
include Output

describe "Output#message" do
  it "displays a valid status when puzzle meets all conditions" do
    msg = message(true)

    expect(msg).to eq "This sudoku is valid."
  end

  it "displays correct message for valid yet incomplete puzzle" do
    msg = message(true, false)

    expect(msg).to eq "This sudoku is valid, but incomplete."
  end

  it "displays an invalid status when puzzle does not meet conditions" do
    msg = message(false)

    expect(msg).to eq "This sudoku is invalid."
  end
end
