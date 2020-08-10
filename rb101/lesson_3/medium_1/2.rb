puts "the value of 40 + 2 is " + (40 + 2)

# will error because you cannot perform string concatenation with an integerr

# need to convert integer into a string with to_s
puts "the value of 40 + 2 is " + (40 + 2).to_s

# or use string interpolation
puts "the value of 40 + 2 is #{40 + 2}"