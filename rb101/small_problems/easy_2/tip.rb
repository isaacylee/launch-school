def dollar_format(amount)
  format('%.2f', amount).to_f
end

print "What is the bill amount? $"
bill_amount = gets.chomp.to_f

print "What is the tip percentage? "
tip_percentage = gets.chomp.to_f / 100

tip = dollar_format(bill_amount * tip_percentage)
bill_total = dollar_format(bill_amount + tip)

puts "----------------------------"
puts "The tip is $#{tip}."
puts "The bill total is $#{bill_total}."