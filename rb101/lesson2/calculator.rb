# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts(">> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message1(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def operation_to_message2(op)
  case op
  when '1'
    'plus'
  when '2'
    'minus'
  when '3'
    'multiplied by'
  when '4'
    'divided by'
  end
end

prompt(MESSAGES["welcome"])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}.")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES["first_number"])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES["second_number"])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end

  operator_prompt = MESSAGES["operator"]
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["valid_operator"])
    end
  end

  prompt("#{operation_to_message1(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{number1} #{operation_to_message2(operator)} #{number2} is #{result}.")

  prompt(MESSAGES["recalculate"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES["goodbye"])
