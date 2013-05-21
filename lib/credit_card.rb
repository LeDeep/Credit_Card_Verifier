class CreditCard

  attr_accessor :number

  def initialize(number)
    @number = number.gsub(/\s+/, '')
  end

  def card_type
    if @number =~ /^3[47]\d?{13}$/
      "Amex"
    elsif @number =~ /^6011\d?{12}$/
      "Discover"
    elsif @number =~ /^5[1-5]\d?{14}$/
      "MasterCard"
    elsif @number =~ /^4\d?{12}(\d{3})?$/
      "Visa"
    else
      "Unknown"
    end
  end


  def valid? #is the card number validated by the Luhn algorithm
    total = 0
    @number.chars.reverse.each_slice(2) do |digit|
      total += digit[0].to_i
      doubled = digit[1].to_i * 2
      doubled -= 9 if doubled > 9
      total += doubled
    end
    total % 10 == 0
  end


  def to_s
    "#{card_type}: #{@number}" +  " (#{valid? ? 'Valid' : 'Invalid' })"
  end

end
