# def featured?(num)
#   num % 7 == 0 && 
#   num.odd? && 
#   num.digits.size == num.digits.uniq.size
# end

# def featured(num)
#   num += 1
#   num += 1 until featured?(num)
#   num
# end

# Above works, but takes much longer due to unnecessary looping.
# Refactored to find the first next odd multiple of seven.
# Only need to check every 14 numbers onwards.


def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    return num if num.digits.uniq == num.digits
    num += 14
    break if num >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end