def normal_greeting(name)
  puts "Hello, #{name}!"
end

def loud_greeting(name)
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
end

puts ">> What is your name?"
name = gets.chomp

if name.end_with?("!")
  name.chop!
  loud_greeting(name)
else
  normal_greeting(name)
end