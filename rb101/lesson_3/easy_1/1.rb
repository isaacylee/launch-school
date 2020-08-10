numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

# the 'puts' method automatically calls to_s on its argument
# p numbers would result in => [1, 2, 2, 3] as it calls inspect on the items
