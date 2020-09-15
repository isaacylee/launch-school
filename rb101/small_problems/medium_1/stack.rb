# Initialize stack and register variables (as an array and 0 respectively)
# Convert input string into an array
# Define the various methods
# Iterate through the array and perform each operation

# def is_integer?(str)
#   str == str.to_i.to_s
# end

# def minilang(input_string)
#   stack = []
#   register = 0

#   input_array = input_string.split
#   input_array.each do |input|
#     if is_integer?(input)
#       register = input.to_i
#     elsif input == "PUSH"
#       stack << register
#     elsif input == "ADD"
#       register += stack.pop
#     elsif input == "SUB"
#       register -= stack.pop
#     elsif input == "MULT"
#       register *= stack.pop
#     elsif input == "DIV"
#       register /= stack.pop
#     elsif input == "MOD"
#       register = register % stack.pop
#     elsif input =="POP"
#       register = stack.pop
#     elsif input == "PRINT"
#       puts register
#     end
#   end
# end

# Refactored using a case statement, assuming input will only contain one of the commands or an integer

def minilang(input_string)
  stack = []
  register = 0

  input_array = input_string.split
  input_array.each do |input|
    case input
    when "PUSH" then stack << register
    when "ADD" then register += stack.pop
    when "SUB" then register -= stack.pop
    when "MULT" then register *= stack.pop
    when "DIV" then register /= stack.pop
    when "MOD" then register %= stack.pop
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    else            register = input.to_i
    end
  end
end
