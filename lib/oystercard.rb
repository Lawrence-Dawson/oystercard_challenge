require_relative 'JourneyHistory.rb'
require_relative 'station.rb'
require_relative 'journey'

class Oystercard

  attr_reader :balance

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @current_journey = nil
    @journey_history = JourneyHistory.new
  end

  def touch_in(station_name, zone)
    fail 'you have insufficient funds on your oystercard' if balance < MIN_FARE
    station = Station.new(station_name, zone)
    if @current_journey != nil #if the user has already touched in without touching out
      @current_journey.set_end_station(nil) #this line is optional for now as it is by default already nil
      @journey_history.record_journey(@current_journey)
      deduct(@current_journey.fare) #deduts the penalty fare
    end

    @current_journey = Journey.new(station, zone)
  end

  def touch_out(station, zone)
    if @current_journey == nil
       @current_journey = Journey.new(nil)
    end
    @current_journey.set_end_station(station, zone)
    deduct(@current_journey.fare)
    @journey_history.record_journey(@current_journey)
    @current_journey = nil
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
