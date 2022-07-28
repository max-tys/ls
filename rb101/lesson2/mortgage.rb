def prompt(msg)
  print ">> #{msg}"
end

def valid_integer(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def valid_integer_zero_permitted(num)
  num.to_i.to_s == num
end

def valid_float(num)
  (num.to_f.to_s == num) && (num.to_f > 0)
end

def valid_num(num)
  valid_integer(num) || valid_float(num)
end

# Welcome message
prompt("This is a mortgage calculator.\n")

# Determine the loan amount and convert input to a float value.
loan_amount = ''
loop do
  prompt("What is the loan amount in dollars? ")
  loan_amount = gets.chomp
  break if valid_num(loan_amount)
  prompt("Invalid loan amount. Please input a positive number.\n")
end
loan_amount = loan_amount.to_f # This is a really important step!

# Obtain the APR. Derive the monthly interest rate
# Convert the monthly interest rate to a float value.
apr = ''
loop do
  prompt("What is the Annual Percentage Rate (APR) e.g. 5 for 5%? ")
  apr = gets.chomp
  break if valid_num(apr)
  prompt("Invalid APR. Please input a positive number.\n")
end
monthly_interest_rate = apr.to_f / 1200

# Obtain the loan duration in years and months.
# Then compute the loan duration in months only.
loan_duration_year = ''
loan_duration_month = ''

prompt("What is the loan duration? Input the years and months.\n")

loop do
  prompt("How many years do you have left in the loan? ")
  loan_duration_year = gets.chomp
  break if valid_integer_zero_permitted(loan_duration_year)
  prompt("Invalid number of years. Please input an integer.\n")
end

loop do
  prompt("How many months do you have left in the loan? ")
  loan_duration_month = gets.chomp
  break if valid_integer_zero_permitted(loan_duration_month)
  prompt("Invalid number of months. Please input an integer.\n")
end

loan_duration_month = (loan_duration_year.to_i * 12) + loan_duration_month.to_i

# Calculate the monthly payment using the inputs provided earlier.
monthly_payment = loan_amount *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-loan_duration_month)))

# Display the monthly payment.
prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}.\n")

# Exit message
prompt("Thanks for using the calculator!")
