def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
# This returns an empty array.
# On line 13, we invoke the method called my_method, and we pass in an empty array to the method.
# The parameter on line 1, array, is assigned to the empty array object.
# On line 2, the expression, array.empty?, returns true.
# Thus, the empty aray on line 3 is returned.

p my_method([3])
# This returns nil. (???)
# The parameter of my_method, namely array, is assigned to [3], the argument.
# [3] does not satisfy the condition at line 2 because it is not empty.
# Since elsif is missing a conditional expression, the Ruby parser looks for the expression on the next line.
# The entire map call is the conditional expression.
# There is no code left to execute in the branch.
# Thus, the method returns nil.

p my_method([3, 4])
# Same explanation as above.

p my_method([5, 6, 7])
# Same explanation as above.
