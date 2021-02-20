arr = Array(1..10)
half = arr.each_slice( (arr.size/2.0).round ).to_a

p arr
p half.class
p half

