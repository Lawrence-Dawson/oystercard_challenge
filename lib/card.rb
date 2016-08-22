class Card

attr_reader :balance

  def initialize
    @balance = 0
  end

  #consider using attr_accessor for the balance below so we don't call @balance directly.
  def add(value)
    fail "Max top up value exceeded" if value >= 100
    @balance += value
  end

end
