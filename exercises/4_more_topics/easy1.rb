# 1 Enumerable Class Creation

# class Tree
#   include Enumerable

#   def each; end
# end

# 2 Optional Blocks

# def compute(arg)
#   block_given? ? yield(arg) : 'Does not compute.'
# end

# p compute(5) { |num| num + 3 } == 8
# p compute('hello') { |text| text + ' world' } == 'hello world'
# p compute(:test) == 'Does not compute.'

# 3 Find Missing Numbers

# input - array of integers in ascending order
# output - array of integers between first and last elements
  # if input array contains only 1 integer, output an empty array
  # if input array does not have any missing integers, output an empty array
  # 0 is an integer
# algorithm
  # create an array of integers from the first to the last
  # subtract the input array from the new array
  # return the array of missing numbers

# def missing(input_array)
#   complete_array = (input_array.first..input_array.last).to_a
#   complete_array - input_array
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# 4 Divisors

# input - a single, positive integer
# output - an array of integers
  # each integer in the output array is a divisor of the input
# algorithm
  # every number is a divisor of itself, so the array will always have 1+ int
  # 1 is a divisor of every number
  # we don't have to test from 1 to the input number
  # any number greater than half of the input number cannot be a divisor
  # if a number is a divisor, the dividend is also a divisor
  # we can stop checking once a test number is in the output array

# def divisors(n)
#   factors = [1, n].uniq

#   2.upto(n/2) do |int|
#     break if factors.include? int

#     if n % int == 0
#       factors << int
#       factors << n / int
#     end
#   end

#   factors.sort
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(48) == [1, 2, 3, 4, 6, 8, 12, 16, 24, 48]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]

# 5 Encrypted Pioneers (ROT13)

# encrypted_names = %Q(Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu)

# encrypted_name_list = encrypted_names.split("\n")

# UPPER = ('A'..'Z').to_a
# LOWER = ('a'..'z').to_a

# def rot13(cipher_text)
#   plain_text = ''

#   cipher_text.chars do |char|
#     if /[a-z]/i =~ char
#       idx = UPPER.index(char.upcase)
#       new_idx = (idx + 13) % 26
#       plain_text << (UPPER.include?(char) ? UPPER[new_idx] : LOWER[new_idx])
#     else
#       plain_text << char
#     end
#   end

#   plain_text
# end

# encrypted_name_list.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

# 6 Iterators: True for Any?

# def any?(array)
#   array.each { |element| return true if yield(element) }
#   false
# end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# 7 Iterators: True for All?

# def all?(collection)
#   collection.each { |item| return false unless yield(item) }
#   true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

# 8 Iterators: True for None?

# def none?(collection)
#   collection.each { |item| return false if yield(item) }
#   true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# 9 Iterators: True for One?

# def one?(collection)
#   # new_collection = collection.select { |item| yield(item) }
#   # new_collection.size == 1

#   matches = 0

#   collection.each do |item|
#     matches += 1 if yield(item)
#     return false if matches > 1
#   end

#   matches == 1
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    == true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
# p one?([2, 4, 6, 8]) { |value| value.even? }    == false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p one?([1, 3, 5, 7]) { |value| true }           == false
# p one?([1, 3, 5, 7]) { |value| false }          == false
# p one?([]) { |value| true }                     == false

# 10 Count Items

# def count(array)
#   matches = 0
#   array.each { |item| matches += 1 if yield(item) }
#   matches
# end

# def count(array)
#   idx = 0
#   matches = 0
#   while idx < array.size
#     matches += 1 if yield(array[idx])
#     idx += 1
#   end
#   matches
# end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
