require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'
require_relative 'text'

=begin
class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(30)
  end

  def test_accept_money
    starting_amount = @register.total_money

    @transaction.amount_paid = 30
    @register.accept_money(@transaction)
    ending_amount = @register.total_money

    assert_equal(starting_amount + 30, ending_amount)
  end

  def test_change
    @transaction.amount_paid = 40
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $30.\n") do
      @register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end
=end

class TextTest < Minitest::Test
  def setup
    @file = File.open("sample_text_2.txt")
    @text = Text.new(@file.read)
  end

  def test_swap
    expected_text = <<-TEXT.chomp
Lor-m ipsum dolor sit am-t, cons-ct-tur adipiscing -lit. Cras s-d vulputat- ipsum.
Susp-ndiss- commodo s-m arcu. Don-c a nisi -lit. Nullam -g-t nisi commodo, volutpat
quam a, viv-rra mauris. Nunc viv-rra s-d massa a condim-ntum. Susp-ndiss- ornar- justo
nulla, sit am-t mollis -ros sollicitudin -t. Etiam maximus mol-sti- -ros, sit am-t dictum
dolor ornar- bib-ndum. Morbi ut massa n-c lor-m tincidunt -l-m-ntum vita- id magna. Cras
-t varius mauris, at phar-tra mi.
      TEXT
    assert_equal(expected_text, @text.swap('e', '-'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    # puts "File has been closed: #{@file.closed?}"
  end
end