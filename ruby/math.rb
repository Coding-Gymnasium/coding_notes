#Math methods

#https://ruby-doc.org/core-3.0.0/Math.html

puts Math.sqrt(25)
x = -1
puts x > 0 && Math.sqrt(-1)
## Without the save guard 'x > 0' this error comes up: ruby/math.rb:6:in `sqrt': Numerical argument is out of domain - "sqrt" (Math::DomainError) from ruby/math.rb:6:in `<main>'
# With the greater than zero safe guard the output should be 'false'
