# Get two positive integers from user
# Check they are positive integers

puts "Enter the first number:"
num1 = gets.chomp.to_i

puts "Enter the second number:"
num2 = gets.chomp.to_i

# Calculate each operation

sum = num1 + num2
difference = num1 - num2
product = num1 * num2
quotient = num1 / num2
remainder = num1 % num2
power = num1 ** num2

# Display each operation
puts "#{num1} + #{num2} = #{sum}"
puts "#{num1} - #{num2} = #{difference}"
puts "#{num1} * #{num2} = #{product}"
puts "#{num1} / #{num2} = #{quotient}"
puts "#{num1} % #{num2} = #{remainder}"
puts "#{num1} ** #{num2} = #{power}"
