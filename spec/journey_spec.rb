require 'journey'

describe Journey do
  let(:station) {double :station, zone: 1}
  subject(:journey) { described_class.new(station: station)}


  it 'has an entry station' do
    journey = Journey.new(station)
    expect(journey.entry_station).to eq station
  end

describe '#finish ' do

  it 'return exit station when journey finishes' do
    expect(subject.finish(station)).to eq station
  end

end

describe '#fare' do

  it 'calculates the fare' do
    subject.finish(station)
    expect(subject.fare).to eq Journey::MIN_FARE
  end

  it 'knows if a journey is complete' do
    subject.finish(station)
    expect(subject).to be_complete
  end

  it 'it gives a penalty fare by default and when no exit station' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

end


end
