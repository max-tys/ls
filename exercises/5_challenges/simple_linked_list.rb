class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def empty?
    size == 0
  end

  def push(datum)
    self.head = head.nil? ? Element.new(datum) : Element.new(datum, head)
    self.size += 1
  end

  def peek
    empty? ? nil : head.datum
  end

  def pop
    old_head_datum = peek
    self.head = head.next
    self.size -= 1
    old_head_datum
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil? || array.empty?
    array.reverse.each { |datum| new_list.push(datum) }
    new_list
  end

  def to_a
    array = []
    return array if empty?

    current_element = head
    loop do
      array << current_element.datum
      break if current_element.tail?
      current_element = current_element.next
    end

    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    to_a.each { |datum| new_list.push(datum) }
    new_list
  end
end
