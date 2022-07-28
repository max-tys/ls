# (1..99).to_a.each { |num| puts num if num.odd? }

# 1.upto(99) { |i| puts i if i.odd? }

odd_numbers = (1..99).to_a.select { |i| i if i.odd? }
puts odd_numbers
