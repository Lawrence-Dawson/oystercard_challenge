class Oystercard

  attr_reader :balance, :journeys

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    # @journeys = {}
    @current_journey = nil
    @journey_history = JourneyHistory.new
  end

  def touch_in(station_name)
    fail 'you have insufficient funds on your oystercard' if balance < MIN_FARE
    station = Station.new(station_name)
    if @current_journey != nil #if the user has already touched in without touching out
      @current_journey.set_end_station(nil) #this line is optional for now as it is by default already nil
      @journey_history.record_journey(@current_journey)
      #@current_journey.fare #sets the fare to penatly fare
      deduct(@current_journey.fare) #deduts the penalty fare
    end

    @current_journey = Journey.new(station)
    # @journeys[:entry] = station
  end

  def touch_out(station)
    if @current_journey == nil
      @current_journey = Journey.new(nil)
    end

    @current_journey.set_end_station(station)
    deduct(@current_journey.fare)
    @journey_history.record_journey(@current_journey)
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
