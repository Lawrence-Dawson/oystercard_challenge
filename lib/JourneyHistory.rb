class JourneyHistory

  def initialize
    @journey_history = []
  end

  def record_journey(journey)
    @journey_history << journey
  end
end
