class Oystercard

attr_reader :balance, :in_journey

MAX_CARD_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  #consider using attr_accessor for the balance below so we don't call @balance directly.
  def top_up(value)
    fail "Balance after top up cannot exceed £#{MAX_CARD_LIMIT}" if (@balance + value) > MAX_CARD_LIMIT
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    in_journey
  end

  def touch_in
    @in_journey = true
    #self
  end

  def touch_out
    @in_journey = false
  end

  
end
