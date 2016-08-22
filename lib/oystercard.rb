class Oystercard

attr_reader :balance

MAX_CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  #consider using attr_accessor for the balance below so we don't call @balance directly.
  def top_up(value)
    fail "Balance after top up cannot exceed £#{MAX_CARD_LIMIT}" if (@balance + value) > MAX_CARD_LIMIT
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

end
