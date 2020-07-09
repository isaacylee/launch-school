print "What is your age? "
current_age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retirement_age -  current_age
retirement_year = current_year + years_left

puts "It's #{current_year}, so you will retire in #{retirement_year}."
puts "You only have #{years_left} years of work to go!"