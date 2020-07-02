vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(vehicles)
  count = Hash.new
  
  vehicles.each do |vehicle|
    if count[vehicle] 
      count[vehicle] += 1
    else
      count[vehicle] = 1
    end
  end

  count.each { |k, v| puts "#{k} => #{v}" }
  
end

count_occurrences(vehicles)

puts "--------"

#Further exploration

def count_occurrences_modified(vehicles)
  count = Hash.new
  
  vehicles = vehicles.map(&:downcase)
  vehicles.each do |vehicle|
    if count[vehicle] 
      count[vehicle] += 1
    else
      count[vehicle] = 1
    end
  end

  count.each { |k, v| puts "#{k} => #{v}" }
  
end

count_occurrences_modified(vehicles)