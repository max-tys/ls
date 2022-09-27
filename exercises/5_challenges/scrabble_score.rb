class Scrabble
  attr_reader :word

  SCORES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    # handle nil inputs
    @word = word ? word : ''
  end

  def score
    # handle whitespaces in input word
    letters = word.strip.upcase.chars
    word_score = 0

    letters.each do |letter|
      SCORES.each do |range, value|
        word_score += value if range.include?(letter)
      end
    end

    word_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
