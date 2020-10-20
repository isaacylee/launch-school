PAIRS = {
  "b" => "o", "x" => "k", "d" => "q", "c" => "p",
  "n" => "a", "g" => "t", "r" => "e", "f" => "s",
  "j" => "w", "h" => "u", "v" => "i", "l" => "y", 
  "z" => "m"
}

def block_word?(str)
  str.downcase!
  test_str = ""

  str.chars.each do |char|
    if PAIRS.values.include?(char)
      test_str << char 
    else
      test_str << (PAIRS[char])
    end
  end

  str.length == test_str.split('').uniq.size
end

puts block_word?('BATCH')
puts block_word?('BUTCH')
puts block_word?('jest')

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end