require 'journey'

describe Journey do
  let(:station) {double :station}
  let(:zone) {1}
  subject(:journey) { described_class.new(station, zone)}


  it 'has an entry station' do
    journey = Journey.new(station, zone)
    expect(journey.entry_station).to eq station
  end

  describe '#fare' do

    it 'calculates the fare' do
      subject.set_end_station(station, zone)
      expect(subject.fare).to eq Journey::MIN_FARE
    end

    it 'knows if a journey is complete' do
      subject.set_end_station(station, zone)
      expect(subject).to be_complete
    end

    it 'it gives a penalty fare by default and when no exit station' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
end
