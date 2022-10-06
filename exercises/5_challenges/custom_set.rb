require 'pry'

class CustomSet
  def initialize(array = [])
    @set = array
  end

  def empty?
    set.empty?
  end

  def contains?(obj)
    set.include?(obj)
  end

  def subset?(other)
    set.all? { |element| other.contains? element }
  end

  def disjoint?(other)
    set.none? { |element| other.contains? element }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  alias_method :==, :eql?

  def add(obj)
    set << obj unless set.include?(obj)
    self
  end

  def intersection(other)
    overlap = CustomSet.new
    set.each { |element| overlap.add(element) if other.contains? element }
    overlap
  end

  def difference(other)
    diff = CustomSet.new
    set.each { |element| diff.add(element) unless other.contains? element }
    diff
  end

  def union(other)
    CustomSet.new((set + other.set).uniq)
  end

  protected

  attr_reader :set
end
