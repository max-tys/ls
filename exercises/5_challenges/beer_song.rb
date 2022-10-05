class BeerSong
  def self.verse(n)
    line_one(n) + line_two(n)
  end

  def self.verses(start_num, end_num)
    all_verses = []
    start_num.downto(end_num) { |num| all_verses << verse(num) }
    all_verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def bottle(n)
      n > 1 ? "bottles" : "bottle"
    end

    def line_one(n)
      if n > 0
        "#{n} #{bottle(n)} of beer on the wall, #{n} #{bottle(n)} of beer.\n"
      else
        "No more bottles of beer on the wall, no more bottles of beer.\n"
      end
    end

    def line_two(n)
      if n > 1
        "Take one down and pass it around, " +
        "#{n - 1} #{bottle(n - 1)} of beer on the wall.\n"
      elsif n == 1
        "Take it down and pass it around, " +
        "no more bottles of beer on the wall.\n"
      else
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
  end
end