class Journey

  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station, zone = nil)
    @entry_station = station
    @exit_station = nil
    @fare = nil
    @entry_zone = zone
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  def set_end_station(station, zone = nil)
    @exit_station = station
    @exit_zone = zone
  end

  def fare
    if complete? == true
      @fare = (@entry_zone - @exit_zone).abs + MIN_FARE
    else
      @fare = PENALTY_FARE
    end
  end
end
