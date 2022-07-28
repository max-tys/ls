# 4. Working with Blocks

## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

Output:
```
1
3
```
Return value:
```
[1, 3]
```

| Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
| ---- | ------ | ------ | ----------- | ------------ | --------------------- |
| Line 1| Method call (map) | Outer array | No side effect | New array [1, 3] | Return value is unused. |
| Lines 1 - 4 | Block execution | Sub-array | No side effect | Integer at index 0 of the sub-array | Yes, used by map for transformation |
| Line 2 | Method call (puts and first) | arr.first and arr respectively | Outputs 1 and 3. No other side effects. | nil, element at index 0 of sub-array arr | puts's return value is unused, but first's return value is used by puts |
| Line 3 | Method call (first) | arr | No side effect | 1 on the first iteration, 3 on the second iteration.| Yes, used to determine return value of block. |

## Example 4
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

Output:
```
18
7
12
```
Return value:
```
[[18, 7], [3, 12]]
```

| Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
| ---- | ------ | ------ | ----------- | ------------ | --------------------- |
| 1 | Variable assignment | The return value of the each method call on a nested array | None | [[18, 7], [3, 12]] | No |
| 1 | Method call (each) | Outer array | None | Outer array | Yes, the return value is used for the assignment of local variable my_arr |
| 1 - 7 | Outer block execution | Each sub-array | None | Each sub-array | No |
| 2 | Method call (each) | Sub-array | None | Sub-array | Yes, used to determine return value of outer block |
| 2 - 6 | Block execution | Element of sub-array in that iteration | None | nil if condition is met, nil if condition isn't met | No |
| 3 | Comparison (>) | Element of sub-array in that iteration | None | Boolean | Yes, evaluated by if |
| 3 - 5 | Conditional (if) | The result of the expression num > 5 | None | nil | Yes, used to determine return value of inner block |
| 4 | Method call (puts) | Element of sub-array in that iteration | Output a string representation of an integer | nil | Yes, used to determine the return value of the conditional statement if the condition is met |

## Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

Output:
```

```
Return value:
```
[[2, 4], [6, 8]]
```

| Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
| ---- | ------ | ------ | ----------- | ------------ | --------------------- |
| 1 | Method call (map) | Outer array | None | [[2, 4], [6, 8]] | No |
| 1 - 5 | Outer block execution | Each sub-array | None | [2, 4] and [6, 8] | Yes. It is used by the top-level map for transformation. |
| 2 | Method call (map) | Sub-array | None | [2, 4] and [6, 8] | Yes. It determines the return value of the outer block. |
| 2 - 4 | Inner block execution | Element of the sub-array in that iteration | None | 2 4 6 8 | Yes. It is used by the inner map for transformation. |
| 3 | Method call (*) with integer 2 as an argument | Element of the sub-array in that iteration | None | 2 4 6 8 | Yes. It determines the return value of the inner block. |

