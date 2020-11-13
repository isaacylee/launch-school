word_bank = {
  noun: %w(cat bear fern knife clock),
  adverb: %w(happily begrudgingly surprisingly quickly),
  adjective: %w(lumpy white sad bright large),
  verb: %w(runs flies throws steals hides)
}

puts "The #{word_bank[:adjective].sample} brown #{word_bank[:noun].sample} 
#{word_bank[:adverb].sample} #{word_bank[:verb].sample} the 
#{word_bank[:adjective].sample} yellow #{word_bank[:noun].sample}, 
who #{word_bank[:adverb].sample} #{word_bank[:verb].sample} his 
#{word_bank[:noun].sample} and looks around."
