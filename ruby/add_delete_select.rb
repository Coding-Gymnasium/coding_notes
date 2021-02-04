=begin
Ruby has destructive and non destructive methods to add, delete or select elements in Arrays and Hashes.
Destructive: 
  - keep_if. ie. arr.keep_if { |x| x > 2 } or h.keep_if { |key, value| key % 2 == 0 }
  - delete_if ie. arr.delete_if { |x| x < 2 } or h.delete_if { |k, v| key % 2 != 0 }

Non-Destructive: 
  - store ie. h.store(key, value)
  - select ie. h.select {|k, v| v > 0 && v < 10 }
  - reject ie. h.reject {|k, v| v < 0 && v > 10 }
  - drop_while ie. h.drop_while { |k, v|  h.drop_while { |k, v| v <= 3 }
  










=end

x = [1, 2, 3]
puts x
