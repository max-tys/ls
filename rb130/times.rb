# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number #  return the original method argument
end

# method invocation
times(5) do |num|
  puts num
end