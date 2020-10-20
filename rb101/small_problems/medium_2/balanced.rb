# def balanced?(str)
  
#   parantheses = str.gsub(/[^()]/, '')
#   return true if parantheses == ''

#   (parantheses.count("(") == parantheses.count(")")) && parantheses.start_with?("(") && parantheses.end_with?(")")
# end

# Above method works, however is too clunky (especially if expanding it to other punctuation)

def balanced?(str)
  labels = %w( () "" '' [] {} )
  results = []

  labels.each do |label|
    counter = 0

    str.each_char do |char|
      counter += 1 if char == label[0]
      counter -= 1 if char == label[1]
      results << false if counter < 0
    end
  
    results << counter.zero?
  end

  results.all?{ |result| result == true } ? true : false 
end