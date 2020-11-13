require 'pry'
require 'pry-byebug'

def neutralize(sentence)
  words = sentence.split(' ')
  words = words.select { |word| !negative?(word) }

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end
binding.pry
puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.