def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
# [4, 5, 3, 6]
# When the method defines default arguments ...
# ... you do not need to supply all the arguments to the method.
# Ruby will fill in the missing arguments in-order.
# First 4 is assigned to a, then 6 is assigned to d.
# This leaves only the arguments with default values.
# Since 5 has not been assigned to a value yet, it is given to b.
# c uses its default value of 3.
