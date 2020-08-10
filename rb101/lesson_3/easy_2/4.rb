advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino") 
# => false
advice.match?("Dino")
# => false, both are case-sensitive