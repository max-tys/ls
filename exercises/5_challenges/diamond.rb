class Diamond
  ALPHABETS = ('A'..'Z').to_a

  def self.make_diamond(mid_letter)
    # Calculate the diamond's width
    mid_idx = ALPHABETS.index(mid_letter)
    diamond_width = mid_idx * 2 + 1

    # Create top and middle rows with make_row helper method
    rows = []
    0.upto(mid_idx) do |idx|
      letter = ALPHABETS[idx]
      rows << make_row(idx, diamond_width, letter)
    end

    # Join top half to bottom half of diamond
    (rows + rows.reverse[1..-1]).join
  end

  class << self
    private

    def make_row(idx, width, letter)
      # The first row is unique - it only contains 1 letter
      if idx.zero?
        letter.center(width) + "\n"
      # All other rows contain two letters and follow a pattern
      else
        middle_spaces = " " * (idx * 2 - 1)
        (letter + middle_spaces + letter).center(width) + "\n"
      end
    end
  end
end