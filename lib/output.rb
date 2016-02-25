module Output

  def message(valid, complete = true)
    if valid && !complete
      outcome = "valid, but incomplete."
    elsif valid
      outcome = "valid."
    else
      outcome = "invalid."
    end
    "This sudoku is #{outcome}"
  end
end
