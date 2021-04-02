# Ternary
three = 3

puts three == 3 ? 'this is three' : 'not three'

# Ternary example of use for if..elsif...elsif...else statment. Not best practice as if..elsif..else statment is clearer.

puts three == 2 ? 'not three but two' : three == 1 ? 'not three but one' : three == 3 ? 'This is three' : "we don't know"
