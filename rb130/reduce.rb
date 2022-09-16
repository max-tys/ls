# input - array, optionally accumulator, and a block
# output - an 'accumulated' object
# algo
  # if an acc is provided
    # the first operand is the acc
    # the second operand is the first element of the array
      # extract the first element from the array permanently (destructive)
  # if an acc is not provided
    # the first operand is the array's first element
    # assign the acc to the first operand, delete first element from array
    # the new first element of the array is the second operand
  # iterate until we run out of operands
    # 'combine' the first and second operands, e.g. + or *
    # reassign the acc to the return value of the combined object
    # 'combine' the acc with the third operand
    # reassign the acc to the return value of the combined object
    # continue until we've combined the last element of the array
  # return the final combined object

# if acc is supplied, omitted will return nil
# if acc is not supplied, omitted is assigned to true
def reduce(array, acc = omitted = true)
  # preserve contents of input array for future use
  array = array.clone

  # if no default acc is supplied, the acc is set to the array's first element
  acc = array.shift if omitted

  # loop until the array is empty
  while !array.empty?
    # supply two arguments to the block
    # reassign acc to the return value of the block
    acc = yield(acc, array.shift)
  end

  # return the accumulator
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc * num }                    # => 120
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass