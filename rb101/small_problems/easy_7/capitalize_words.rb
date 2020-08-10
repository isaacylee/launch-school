def word_cap(str)
  str.split.each {|word| word.capitalize!}.join(' ')
end

# Write a method to capitalize words without using capitalize
def word_cap_fe(str)
  words_array = str.split.map{|word| word.split('')}
  words_array.map do |arr|
    arr[0], arr[1..-1] = arr[0].upcase, arr[1..-1].map(&:downcase)
  end
  words_array.map{|arr| arr.join('')}.join(' ')
end

# Another solution

def word_cap_fe_2(str)
  str.split.map{|word| word[0].upcase + word[1..-1].downcase}.join('')
end
