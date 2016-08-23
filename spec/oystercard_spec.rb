
require 'oystercard.rb'

describe Oystercard do
  let(:station) {double :station}

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

  describe '#in_journey?' do

    it 'is initially not in journey' do
      expect(subject.entry_station).to eq nil
    end

  end

  describe '#touch_in' do
      let(:station) {double :station}

    it 'raises an error if minimum balance on oystercard is less than 1' do
      expect{subject.touch_in(station)}.to raise_error 'you have insufficient funds on your oystercard'
    end

    it 'remembers entry station after touch in' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end


  end

  describe '#touch_out' do
    it 'resets entry station to nil after touch out' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end

    it 'updates balance by deducting fare' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(station)
      expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end
  end



end
