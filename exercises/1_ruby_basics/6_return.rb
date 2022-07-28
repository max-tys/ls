# ============
# RETURN
# ============

# Question 1

def meal
  return 'Breakfast'
end

puts meal #Breakfast

# Question 2

def meal
  'Evening'
end

puts meal #Evening. Implicit return.

# Question 3

def meal
  return 'Breakfast'
  'Dinner'
end

puts meal #Breakfast. Dinner does not execute.

# Question 4

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal #Dinner & Breakfast. Prints both.

# Question 5

def meal
  'Dinner'
  puts 'Dinner'
end

p meal # Dinner nil

# Question 6

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal # Breakfast. Lines 2 and 3 of meal method are not executed.

# Question 7

def count_sheep
  5.times do |sheep| # the block parameter, sheep, represents the count no.
    puts sheep
  end
end

puts count_sheep # 0 1 2 3 4 5.
# The block is an argument we pass to the times method.
# The last line being executed in this method is the invocation of 5.times.
# The return value of 5.times is 5.

# Question 8

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep # 0 1 2 3 4 10
# Nothing is done with the return value of 5.times

# Question 9

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep # 0 1 2 nil
# return is processed once sheep equals 2.
# the last output is nil because return did not provide a value.

# Question 10

def tricky_number
  if true
    number = 1 # The assignment returns the value that was assigned to the variable.
  else
    2
  end
end

puts tricky_number # 1
