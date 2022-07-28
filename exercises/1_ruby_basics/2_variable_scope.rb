# ==================================
# VARIABLE SCOPE - WHAT'S MY VALUE?
# ==================================

# Question 1

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a
# 7. b points to the value 7. b is increased to 17, but not a.\
# Within the method, b points to 17.

# Question 2

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
# 7. The a in my_value is a local variable.
# Not to be confused with the top level variable a.

# Question 3

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# 7. The local variable a inside my_value is different from the top level a.

# Question 4

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

# "Xy-zy". Numbers are immutable, but strings are mutable.

# Question 5

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# "Xyzzy" This is an assignment. An assignment does not change the value of
# the string passed as an argument into the method.

# Question 6

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# Error. a is not visible inside my_value.


# Question 7

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# 3. We can access local variable a within the block.
# Blocks have different variable scoping rules.

# Question 8

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# Error. The variable, a, is initialised inside the block
# The variable, a, cannot be used outside the block.

# Question 9

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# 7. We are reassigning the local block variable a,
# not the a that is initialised outside the block.
# This is because the outer a is shadowed by the inner a.


# Question 10

a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
    # The variable a that appears in this block is being initialised.
    # The initial value is nil.
    # It is not a reference to the local variable a in line 1.
    # Since you cannot add anything to a nil value, you get a NoMethodError.
  end # The return value of array.each is the original array, i.e. [1,2,3]
end

my_value(array)
puts a

# NoMethodError.
