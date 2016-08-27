require 'journey_log'

describe JourneyLog do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  subject(:journey_log) { described_class.new(journey_class: journey_class) } #This creates a new instance of the journey_log class.

  let(:journey) { double :journey, entry_station: entry_station, exit_station: exit_station } #This creates a double of the journey IN PROGRESS.

  let(:journey_class) { double :journey_class, new: journey } #This tells the journey_log @journey_class intance variable to respond to the ".new" call with the journey (IN PROGRESS) double that was made on line 10.


  describe '#start' do
    it 'should return a journey with an entry station' do
      expect(journey_log.start_journey(entry_station)).to eq journey
    end
  end

  describe '#finish' do


    it 'records total journey' do

      allow(journey).to receive(:finish).and_return(exit_station)

      journey_log.start_journey(entry_station)
      journey_log.finish_journey(exit_station)
      expect(journey_log.journey_history).to include(journey)
    end

    xit 'records journey when touch out skipped' do
      journey_log.start_journey(entry_station)
      journey_log.start_journey(entry_station)
      expect(journey_log.journey_history).to include(journey)
    end

    xit 'records journey when touch in skipped' do
      journey_log.finish_journey(exit_station)
      expect(journey_log.journey_history).to include(journey)
    end

  end


end
