# Initialize a bank of switches, with a total of 'n' lights that are OFF
# Iterate through each switch a total of 'n' times
#   toggle every 'nth' light each round
# Select the lights that are ON from the bank

def light_switch(n)
  bank = create_bank(n)

  (1..n).each do |round_number|
    bank = toggle_bank_every_nth(bank, round_number)
  end

  on_lights = bank.select{ |_k, v| v == true}
  on_lights.keys
end

def create_bank(n)
  bank = {}
  1.upto(n) {|switch| bank[switch] = false}
  bank
end

def toggle_bank_every_nth(bank, n)
  bank.each do |k, v|
    if k % n == 0
      bank[k] = !v
    end
  end
end

p light_switch(1000)