class Oystercard

  attr_reader :balance, :journeys

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = {}
  end

  def touch_in(station)
    fail 'you have insufficient funds on your oystercard' if balance < MIN_FARE
    @journeys[:entry] = station
  end


  def touch_out(station)
    deduct(MIN_FARE)
    @journeys[:exit] = station
  end

  def top_up(value)
    fail "Your top up will exceed balance limit of #{BALANCE_LIMIT}!" if value + balance > BALANCE_LIMIT
    @balance += value
  end

private
  def deduct(fare)
    @balance -= fare
  end
end
