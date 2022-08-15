require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval(degrees_c: false)
    @stack = []
    @register = 0
    @program = format(CENTIGRADE_TO_FAHRENHEIT, c: degrees_c) if degrees_c
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => e
    puts e.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token, #{token}"
    end
  end

  def print
    puts @register
  end

  def push
    @stack << @register
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    num1 = @register
    num2 = pop
    @register = num1 + num2
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end
end

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100) # 212
# minilang.eval(degrees_c: 0) # 32
# minilang.eval(degrees_c: -40) # -40

Minilang.new('5 PRINT PUSH 13 PRINT ADD PRINT').eval
# 5
# 3
# 8
