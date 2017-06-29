require 'pry'
class CreditCard
  #1. initialize with numbers
  #2. seperate into 2 arrays, method to seperate and one to put back together
  #3. multiply second array by 2
  #4. check if they equal 70
attr_reader :card_number
  def initialize(cardnumber)
    @card_number = cardnumber
    @opar1 = []
    @opar2 = []
  end

  def array_separate
    i = card_number.length - 1
    while i >= 0
      @opar1.unshift(card_number[i].to_i)
      i -= 1
      if i >= 0
        @opar2.unshift(card_number[i].to_i)
        i -= 1
      end
    end
  end

  def times_eo_by_two
    @opar2.map {|num| num * 2}
  end

  def concat
    @opar2.map do |num|
      if num > 9
        num -= 10
        num + 1
      else
        num
      end
    end
  end

  def concatmore
    opar3 = @opar1 + @opar2
    sum = 0
    opar3.each {|num| sum += num}
    sum
  end

  def check_if
    array_separate
    @opar2 = times_eo_by_two
    @opar2 = concat
    total = concatmore
    if total % 10 == 0
      true
    else
      false
    end
  end
end

puts "Enter in account number"
ans = gets.chomp
credit = CreditCard.new(ans)
if credit.check_if
  puts "Valid number"
else
  puts "Invalid number"
end
