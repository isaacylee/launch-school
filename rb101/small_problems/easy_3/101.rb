# Get 6 number from user
# Push them into an array
numbers = []

5.times do |idx|
  puts "Enter a number (##{idx + 1}):"
  number = gets.chomp.to_i
  numbers.push(number)
end

puts "Enter the last number:"
number = gets.chomp.to_i
if numbers.include?(number)
  puts "The number #{number} appears in #{numbers}."
else
  puts "The number #{number} does not appear in #{numbers}."
end