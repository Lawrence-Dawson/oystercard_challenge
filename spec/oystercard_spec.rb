
require 'oystercard.rb'
require 'journey.rb' #required to fetch the penalty_fare and regular fare only

describe Oystercard do
  let(:station) {double :station}
  let(:zone_one) {1}
  let(:zone_three) {3}

  it 'checks default balance of Oystercard is 0' do
    expect(subject.balance).to eq 0
  end

  it 'adds money to my oyster card' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  describe '#top_up' do

    before do
      subject.top_up(Oystercard::BALANCE_LIMIT)
    end

    it 'will not allow a balance to exceed 90' do
      expect{ subject.top_up 1 }.to raise_error "Your top up will exceed balance limit of #{Oystercard::BALANCE_LIMIT}!"
    end
  end

  describe '#touch_in' do

    it 'raises an error if minimum balance on oystercard is less than 1' do
      expect{subject.touch_in(station, zone_one)}.to raise_error 'you have insufficient funds on your oystercard'
    end

    it 'charges the user a penalty fare if (s)he touches in without having touched out of last journey' do
      subject.top_up(30)
      subject.touch_in(station, zone_one) #touch in without touching out
      expect{subject.touch_in(station, zone_one)}.to change{subject.balance}.by(-Journey::PENALTY_FARE)
    end
  end

  describe '#touch_out' do

    it 'updates balance when touching out' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(station, zone_one)
      expect{ subject.touch_out(station, zone_one) }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end

    it 'charges the user a penalty fare if (s)he touches out without having touched in' do
      expect{subject.touch_out(station, zone_one)}.to change{subject.balance}.by(-Journey::PENALTY_FARE)
    end
  end
end
