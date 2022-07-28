def shout_out_to(name)
  up_name = name.chars.map { |c| c.upcase! }.join

  puts 'HEY ' + up_name
end

shout_out_to('you') # expected: 'HEY YOU'

=begin
On `line 7`, we call the method `shout_out_to` and pass the string object `'you'` as an argument to the method.

The `name` parameter is assigned to the `'you'` string object.

On `line 2`, we first call the `String#chars` method on `name`. This method returns a new array of new string objects, namely `['y', 'o', 'u']`.

After that, we call the `each` method on the aforesaid array. `Array#each` iterates through each element of the array, passing each of them as an argument to the block `{ |c| c.upcase }`.

Within the block, we call the `upcase!` method on each character of the array. `upcase!` returns a capitalized version of the character. So `'y'` would be transformed into `'Y'`, and so on and so forth.

However, `each` does not do anything with the return value of the block. `each` ignores the return value of the block. When `each` has iterated over each element of the array, it returns the original array.

The `name` parameter is not modified by the code in `line 2`. `name` is still `'you'`. Hence, when we call the `puts` method on line 4, it outputs `'HEY you'`.

To fix this, we should call the `Array#map` method line 2 instead of `Array#each`, convert the array into a string by calling the `Array#join` method, and assign the return value of the code on `line 2` to a new local variable. The new variable will be used in place of `name` on `line 4`.
=end