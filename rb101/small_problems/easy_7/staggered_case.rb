def staggered_case(str)
  chars = str.chars
  index = 0

  loop do
    break if index > str.length - 1

    if index.even?
      chars[index] = chars[index].upcase
    else
      chars[index] = chars[index].downcase
    end

    index += 1
  end

  chars.join
end