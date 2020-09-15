# Practice Problem 1

arr = %w(10, 11, 9, 7, 8)

arr.sort do |a,b|
  b.to_i <=> a.to_i
end

# Practice Problem 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published].to_i
end

# to_i is not necessary to call on the string values for 'published' 
# This is because all strings are equal lengths.

# Practice Problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3] # => "g"

arr2[1][:third][0] # => "g"

arr3[2][:third][0][0] # => "g"

hsh1['b'][1] # => "g"

hsh2[:third].keys[0] # => "g"

# Practice Problem 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4

arr2[2] = 4

hsh1[:first][2][0] = 4

hsh2[['a']][:a][2] = 4

# Practice Problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages = 0
munsters.each_value do |details|
  if details["gender"] == "male"
    male_ages += details["age"]
  end
end

male_ages # => 444

# Practice Problem 6

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end

# Practice Problem 7

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
# the array is being modified, not a. arr[0] is pointing to a new object.
# a = 2
arr[1][0] -= a
# b is being referenced here, kind of like:  b[0] -= a
# b = [3, 8]

# Practice Problem 8
hsh = {first: ['the', 'quick'], 
       second: ['brown', 'fox'], 
       third: ['jumped'], 
       fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |strings|
  strings.each do |string|
    vowels = string.chars.select { |char| char =~ /[aeiou]/ }
    puts vowels
  end
end

# Practice Problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

# Practice Problem 10

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# Practice Problem 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end

# Practice Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = {}
arr.each do |sub_arr|
  hash[sub_arr[0]] = sub_arr[1]
end

hash

# Practice Problem 13

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select {|num| num.odd? }
end

# Practice Problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map { |color| color.capitalize }
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

# Practice Problem 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.values.flatten.all? {|int| int.even?}
end

# Practice Problem 16

def uuid
  section_1 = randomizer(8)
  section_2 = randomizer(4)
  section_3 = randomizer(4)
  section_4 = randomizer(4)
  section_5 = randomizer(12)

  puts "#{section_1}-#{section_2}-#{section_3}-#{section_4}-#{section_5}"
end

def randomizer(length)
  char_bank = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f)

  (' '*length).chars.map { |char| char = char_bank.sample }.join
end


a < b
c = b
d > c