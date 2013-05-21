require 'rspec'
require 'credit_card'

describe CreditCard do 
  context '#initialize' do 
    it 'initializes a credit card number' do 
      card = CreditCard.new('12345 12345 12345')
      card.should be_an_instance_of CreditCard
      card.number.should eql '123451234512345'
    end
  end

  context '#card_type' do 
    it 'should return Amex as the card type' do
      card = CreditCard.new('3782 8224 6310 005')
      card.card_type.should eq "Amex"
    end

    it 'should return Discover as the card type' do
      card = CreditCard.new('6011 1111 1111 1117')
      card.card_type.should eq "Discover"
    end

    it 'should return MasterCard as the card type' do
      card = CreditCard.new('5105105105105100')
      card.card_type.should eq "MasterCard"
    end

    it 'should return Visa as the card type' do
      card = CreditCard.new('4111111111111111')
      card.card_type.should eq "Visa"
    end

    it 'should return Visa as the card type' do
      card = CreditCard.new('411111111111111')
      card.card_type.should eq "Visa"
    end

    it 'should return Unknown as the card type' do
      card = CreditCard.new('9111111111111111')
      card.card_type.should eq "Unknown"
    end
  end

  context '#valid?' do 
    it 'should return true for a number that passes the Luhn algorithm' do 
      card = CreditCard.new('4408 0412 3456 7893')
      card.valid?.should be true
    end

    it 'should return false for a number that fails the Luhn algorithm' do 
      card = CreditCard.new('4417 1234 5678 9112')
      card.valid?.should be false
    end
  end

  context '#to_s' do 
    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('4111111111111111')
      card.to_s.should eq "Visa: 4111111111111111 (Valid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('4111111111111')
      card.to_s.should eq "Visa: 4111111111111 (Invalid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('4012888888881881')
      card.to_s.should eq "Visa: 4012888888881881 (Valid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('378282246310005')
      card.to_s.should eq "Amex: 378282246310005 (Valid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('6011111111111117')
      card.to_s.should eq "Discover: 6011111111111117 (Valid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('5105105105105100')
      card.to_s.should eq "MasterCard: 5105105105105100 (Valid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('5105 1051 0510 5106')
      card.to_s.should eq "MasterCard: 5105105105105106 (Invalid)"
    end

    it 'returns the type of card, the card number, and whether the card number is valid' do 
      card = CreditCard.new('9111111111111111')
      card.to_s.should eq "Unknown: 9111111111111111 (Invalid)"
    end
  end

end
