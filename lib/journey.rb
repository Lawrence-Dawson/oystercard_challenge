class Journey

  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @entry_station = station
    @exit_station = nil
    @fare = nil
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  def finish(station)
    @exit_station = station
  end

  def set_end_station(station)
    @exit_station = station
  end

  def fare
    complete? ? @fare = MIN_FARE : @fare = PENALTY_FARE
    @fare
  end
end
