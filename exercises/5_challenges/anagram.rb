class Anagram
  attr_reader :word1

  def initialize(word1)
    @word1 = word1.downcase
  end

  def match(array)
    array.select { |word2| anagram?(word2.downcase) }
  end

  private

  def anagram?(word2)
    word1 != word2 && word1.chars.tally == word2.chars.tally
  end
end