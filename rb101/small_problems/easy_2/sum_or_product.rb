num = ''
loop do
  print "Please enter an integer greater than 0: "
  num = gets.chomp
  if num.to_i.to_s == num && num.to_i > 0
    num = num.to_i
    break
  else
    puts "ERROR: Not a positive integer!"
  end
end

operation = ''
loop do
  print "Enter 's' to compute the sum, 'p' to compute the product: "
  operation = gets.chomp.downcase
  break if %w(s p).include?(operation)
  puts "Invalid operation."
end

case operation
when 's'
  sum = (1..num).reduce(:+)
  puts "The sum of the integers between 1 and #{num} is #{sum}."
when 'p'
  product = (1..num).reduce(:*)
  puts "The product of the integers between 1 and #{num} is #{product}."  
end