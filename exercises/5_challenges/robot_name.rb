class Robot
  ALPHABETS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  attr_accessor :name
  @@names = []

  def initialize
    @name = generate_unique_name
  end

  def reset
    @@names.delete(name)
    self.name = generate_unique_name
  end

  private

  def generate_unique_name
    new_name = ''
    loop do
      2.times { new_name << ALPHABETS.sample }
      3.times { new_name << NUMBERS.sample }
      @@names.include?(new_name) ? new_name = '' : break
    end
    @@names << new_name
    new_name
  end
end