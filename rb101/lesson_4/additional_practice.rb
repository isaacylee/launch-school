# Practice Problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, position|
  flintstones_hash[name] = position
end

# Practice Problem 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.reduce(0, :+)

# Practice Problem 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.each do |key, value|
  ages.delete(key) if value > 100
end

#   Other ways to solve this would be using #select! or #keep_if

# Practice Problem 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.sort.first

#   Also: ages.values.min

# Practice Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.select { |name| name.start_with?("Be")}.first

#   Also: flintstones.index { |name| name[0, 2] == "Be" }

# Practice Problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3]}

# Practice Problem 7
statement = "The Flintstones Rock"
statement_hash = {}
statement.chars.each do |char|
  unless statement_hash.has_key?(char)
    statement_hash[char] = 1
  else
    statement_hash[char] += 1
  end
end

# Practice Problem 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# 1
# 2

# #each is compared against the current length of the array rather than the original
# In other words, after two iterations, the array length is '2', so it stops iterating.

# Practice Problem 9

words = "the flintstones rock"

def titleize(string)
  string.split.map { |word| word.capitalize}.join(' ')
end

# Practice Problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  if (0..17).include?(value["age"])
    value["age_group"] = "kid"
  elsif (18..65).include?(value["age"])
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end
