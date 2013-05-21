require 'rspec'
require 'credit_card'

def welcome
  puts "Welcome to the Credit Card Validator!"
  menu
end


def menu
  puts "Main Menu Options"
  choice = nil
  until choice == 'x'
    puts "Press 'c' to enter your credit card number."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'c'
      check_validity
    when 'x'
      exit
    else
      invalid
    end
  end
end

def check_validity
  card_number = nil
  until card_number == 'x'
    puts "Enter a credit card number to check its validity. Press 'x' to exit: "  
    card_number = gets.chomp
    card = CreditCard.new(card_number)
    puts card.to_s
  end
end

welcome
