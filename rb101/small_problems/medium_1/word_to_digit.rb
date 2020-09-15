NUMBERS = { "one" => "1", "two" => "2", "three" => "3",
            "four" => "4", "five" => "5", "six" => "6",
            "seven" => "7", "eight" => "8", "nine" => "9",
            "zero" => "0" }
 
# def word_to_digit(str)
#   words = str.split
#   words.map do |word|
#     word.replace(NUMBERS[word]) if NUMBERS.keys.include?(word)
#   end
#   words.join(' ')
# end

def word_to_digit(str)
  NUMBERS.keys.each do |word|
    words.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  words
end