def prompt(msg)
  puts ">> #{msg}"
end

def valid_input?(num)
  num.to_i.to_s == num && num.empty? == false && num.to_f > 0
end

error = "---ERROR: Must enter a positive number---"

loop do
  prompt("Let's calculate your mortgage payments!")

  principal = ''
  interest_rate = ''
  loan_years = ''

  loop do
    prompt("Enter loan amount:")
    principal = gets.chomp
    break if valid_input?(principal)
    prompt(error)
  end
  
  loop do
    prompt("Enter Annual Percentage Rate (APR):")
    interest_rate = gets.chomp
    break if valid_input?(interest_rate)
    prompt(error)
  end
  
  loop do
    prompt("Enter loan duration (in years):")
    loan_years = gets.chomp
    break if valid_input?(loan_years)
    prompt(error)
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = (annual_interest_rate) / 12
  loan_months = loan_years.to_i * 12
  monthly_payment = principal.to_i *
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**(-loan_months))) 

  prompt("Your monthly payment will be $#{monthly_payment.round(2)}.")
  prompt("Do you want to calculate another mortgage payment? (y/n)")
  calculate_again = gets.chomp
  break unless calculate_again.downcase == ('y')
end

prompt("Goodbye!")

