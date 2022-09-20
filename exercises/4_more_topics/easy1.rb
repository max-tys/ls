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

UPPER = ('A'..'Z').to_a
LOWER = ('a'..'z').to_a

def decrypt(name)
  plain_text = ''

  name.chars do |char|
    if UPPER.include? char
      idx = UPPER.index(char)
      new_idx = (idx + 13) % 26
      plain_text << UPPER[new_idx]
    elsif LOWER.include? char
      idx = LOWER.index(char)
      new_idx = (idx + 13) % 26
      plain_text << LOWER[new_idx]
    else
      plain_text << char
    end
  end

  plain_text
end

names = %Q(Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu)

name_list = names.split("\n")

name_list.each do |encrypted_name|
  puts decrypt(encrypted_name)
end