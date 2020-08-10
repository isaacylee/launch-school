# Describe the difference between ! and ? in Ruby.
# And explain what would happen in the following scenarios:

# 1. what is != and where should you use it?
#     != means 'not equals' and can be used as a conditional operator

# 2. put ! before something, like !user_name
#     Opposite of its boolean value, if something is 'truthy', putting ! before it will yield 'false'

# 3. put ! after something, like words.uniq!
#     Usually implies that a method is a destructive method
#       **Actually part of the method name, not really "putting" it after as part of Ruby syntax

# 4. put ? before something
#     error, not used this way.

# 5. put ? after something
#     Usually implies that a method will result in a boolean value
#       **Actually part of the method name, not really "putting" it after as part of Ruby syntax
#     Can be placed after something in a ternary operator, as well.

# 6. put !! before something, like !!user_name
#     Calls ! on !(x), the opposite of the opposite of its boolean value => its boolean value
