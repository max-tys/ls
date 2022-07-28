def count_occurrences(array)
  # A hash is the preferred data structure.
  # The count of each vehicle is set to 0 by default. It is nil otherwise.
  count = Hash.new(0)

  # Alternatively, use the Array#count method.
  array.each { |vehicle| count[vehicle.downcase] += 1 }

  # The output is formatted as per the problem specification.
  count.each { |key, value| puts "#{key} => #{value}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'suv'
]

count_occurrences(vehicles)
