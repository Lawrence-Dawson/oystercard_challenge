require 'JourneyHistory.rb'

describe JourneyHistory do

let(:station){double :station}
let(:card){double :card}
let(:journey){double :journey}

  it 'checks that touching in and out creates one journey' do
    subject.record_journey(journey)
    expect(subject.journey_history).to include journey
  end


end
