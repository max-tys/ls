# Write a method which takes a grocery list (array)
# of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit(list)
  list.each_with_object([]) do |(fruit, quantity), output|
    quantity.times { output << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
