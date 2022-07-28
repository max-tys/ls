def cash_format(amount)
  format("%.2f", amount)
end

print 'What is the bill? '
bill = gets.to_f
# No need for .chomp because extraneous characters ..
# .. past the end of a valid number are ignored.

print 'What is the tip percentage? '
tip_percentage = gets.to_f / 100

tip = bill * tip_percentage
# tip = (bill * tip_percentage).round(2)
puts "The tip is $#{cash_format(tip)}."

total = bill + tip
puts "The total is $#{cash_format(total)}."
