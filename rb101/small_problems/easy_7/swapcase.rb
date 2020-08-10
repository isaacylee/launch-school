def swapcase(str)
  chars = str.chars.map do |char|
    if char.match?(/[a-z]/)
      char.upcase
    elsif char.match?(/[A-Z]/)
      char.downcase  
    else
      char
    end
  end
  chars.join
end
