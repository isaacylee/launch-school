# RB101, Lesson 2 : Code-along for command line calculator program

# Requirements:
#   Asks for two numbers
#   Asks for the type of operation to perform (+, -, *, /)
#   Display the result

# Initial attempt before watching video

print "Enter a number:"
num1 = gets.chomp

print "Enter another number:"
num2 = gets.chomp

puts "Please select the type of operation (Add, Subtract, Multiply, or Divide)"
operator = gets.chomp.downcase

case operator
when "add"      then puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
when "subtract" then puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
when "multiply" then puts "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
when "divide"
  if num2 != 0
    puts "#{num1.} / #{num2} = #{num1.to_f / num2.to_f}"
  else
    puts "ERROR"
  end
end

