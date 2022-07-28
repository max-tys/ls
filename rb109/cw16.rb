# Given two arrays a and b
# write a function comp(a, b) (orcompSame(a, b))
# that checks whether the two arrays have the "same" elements,
# with the same multiplicities (the multiplicity of a member is the number of times it appears).
# "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

# Valid arrays
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on.
# It gets obvious if we write b's elements in terms of squares:
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

# Invalid arrays
# If, for example, we change the first number to something else, comp is not returning true anymore:
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
# comp(a,b) returns false because in b 132 is not the square of any number of a.
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
# comp(a,b) returns false because in b 36100 is not the square of any number of a.

# Remarks
# a or b might be [] or {} (all languages except R, Shell).
# a or b might be nil or null or None or nothing (except in C++, COBOL, Crystal, D, Dart, Elixir, Fortran, F#, Haskell, Nim, OCaml, Pascal, Perl, PowerShell, Prolog, PureScript, R, Racket, Rust, Shell, Swift).
# If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.

# Inputs - two arrays, a and b
# Output is a boolean value.
  # Return true if the two arrays have the 'same' elements
  # 'same' = element in b is the square of an element in a

# Algorithm
  # Iterate over the unique values of array a
    # Do not mutate array a as we obtain its unique values
  # Count the number of times that each unique value appears in the original array a
  # Count the number of times that the square of the unique value appears in array b
  # If both counts are the same, we move on to the next unique value
  # If both counts are different, return false.
  # Return true at the end of the method.

def comp(array1, array2)
  return false if array1 == nil || array2 == nil
  array1.uniq.each { |num| return false if array1.count(num) != array2.count(num**2) }
  true
end
