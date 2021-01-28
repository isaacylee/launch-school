# Algorithm
# Create a bank of n light switches using a hash
#   Key: light number, Value: 'on' or 'off'
# Iterate from 1 to n.
# Toggle every nth light by iterating through each hash element.
#   If the key is evenly divisible by n, toggle the light.
# Identify which lights are on by filtering the hash by the switch value and return the keys of the filtered hash.

def toggle_lights(n)
  bank = initialize_bank(n)

  1.upto(n) do |nth|
    toggle_every_nth_light(bank, nth)
  end

  on_lights(bank).keys
end

def initialize_bank(n)
  bank = {}
  (1..n).each do |nth|
    bank[nth] = 'off'
  end
  bank
end

def toggle_every_nth_light(bank, nth)
  bank.each do |light, switch|
    if light % nth == 0
      switch == 'on' ? bank[light] = 'off' : bank[light] = 'on'
    end
  end
end

def on_lights(bank)
  bank.select { |_, switch| switch == 'on' }
end

p toggle_lights(5)

p toggle_lights(10)