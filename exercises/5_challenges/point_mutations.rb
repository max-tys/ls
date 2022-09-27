class DNA
  attr_reader :strand1

  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    distance = 0
    length = strand1.length < strand2.length ? strand1.length : strand2.length
    (0...length).each { |idx| distance += 1 if strand1[idx] != strand2[idx] }
    distance
  end
end