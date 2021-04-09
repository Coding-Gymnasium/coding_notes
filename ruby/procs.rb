def square_of_sum (my_array, proc_square, proc_sum)
    sum = proc_sum.call(my_array)
    proc_square.call(sum)
end

proc_square_number = proc { |x| x * x }
proc_sum_array     = proc { |arr| (arr[0]..arr[-1]).reduce(:+) }
my_array = gets.split().map(&:to_i)

arr1 = [1, 2, 3]

result = square_of_sum(arr1, proc_square_number, proc_sum_array)
puts result
puts result == 36
