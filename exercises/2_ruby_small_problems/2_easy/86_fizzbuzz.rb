def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    case
    when num % 15 == 0  then print "FizzBuzz"
    when num % 5 == 0   then print "Buzz"
    when num % 3 == 0   then print "Fizz"
    else                print num
    end
    print ", " unless num == end_num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
