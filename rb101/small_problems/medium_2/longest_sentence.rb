text = File.read('sample_text.txt')

sentences = text.split(/[!.?]/)

largest_sentence = sentences.sort_by { |sentence| sentence.split.length }.last

number_of_words = largest_sentence.split.length

puts largest_sentence
puts "Contains #{number_of_words} words"