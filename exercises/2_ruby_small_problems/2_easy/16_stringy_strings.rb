def stringy(size, start=1)
  output = ''
  if start == 1
    size.times { |i| i.even? ? output.concat('1') : output.concat('0') }
  else
    size.times { |i| i.even? ? output.concat('0') : output.concat('1') }
  end
  output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
