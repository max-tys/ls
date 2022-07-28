# Repeated substring
# For a given non-empty string s find a minimum substring t and the maximum number k,
# such that the entire string s is equal to t repeated k times.
# The input string consists of lowercase latin letters.
# Your function should return an array [t, k] (in Ruby and JavaScript)

# Input - non-empty string consisting of lowercase Latin letters
# Output - an array consisting of two elements
# => First element is a substring (min length of 1)
# => Second element is an integer, such that substring * integer = input_string

# Data structure - arrays and strings
# Algorithm
# We need to generate substrings from the original string
# We do not need to generate every possible substring
# We only need substrings of a certain length n
# => such that n is a factor of the length of the original string
# We can begin by producing a list of factors of the length of the original string
# => Iterate over a range of numbers (1..size of the original string)
# => Test each number to see whether it's a factor
# => If so, we add this to the factor arrays.
# With the factors array, we can begin to generate substrings.

def f(s)
  substring_sizes = (1..s.length).to_a.select do |num|
    s.length % num == 0
  end

  substring_sizes.each do |substring_size|
    substring = s[0, substring_size]
    repetition = s.length / substring_size
    return [substring, repetition] if substring * repetition == s
  end
end

s = "ababab"
p f(s) #== ['ab', 3]