a = [1, 2, 'three']
b = 0
c = 'nine'
z = [a, b, c]

z[0][0] = 'one'
z[0][1] = 20
z[0][2] = 3
z[1] = 'zero'
z[2] = 9

puts "a is #{a}, b is #{b}, c is #{c}, z is #{z}."
puts z[0] == a ? "a is changed" : "a is unchanged"
puts z[1] == b ? "b is changed" : "b is unchanged"
puts z[2] == c ? "c is changed" : "c is unchanged"

# b and c are unchanged because they were not referenced in the assignments.
# z[1] and z[2] points not to b and c, but the objects that b and c themselves point to .
# rule of thumb - if the element of an array is an array itself, ...
# ... reassigning the value of the outer array or the inner array does the same thing...
# ... and so both values are changed at the same time.
