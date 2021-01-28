# Find the next positive integer that includes the same digits.

# Determine the biggest possible combination of digits.
# Return -1 if num is the largest possible
# Iterate from input + 1 upto the max.
# Return number if all the digits are the same as the input.
#  can check by splitting number into its digits and sorting them and comparing them

def next_bigger_num(num)
  max_num = largest_combination_of_digits(num)

  return -1 if num == max_num

  (num + 1).upto(max_num) do |number|
    return number if same_digits?(number, num)
  end
end

def largest_combination_of_digits(num)
  num.digits.sort.reverse.join.to_i
end

def same_digits?(num1, num2)
  num1.digits.sort == num2.digits.sort
end

p next_bigger_num(9)
p next_bigger_num(12)
p next_bigger_num(513)
p next_bigger_num(2017)
p next_bigger_num(111)
p next_bigger_num(531)
p next_bigger_num(123456789)