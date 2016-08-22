require 'oystercard'

describe Oystercard do

let (:a_station) {double :a_station}

  it "allows to store money" do
    expect(subject.balance).to eq(0)
  end

  it "topup money to card" do
    expect{subject.top_up(10)}.to change{subject.balance}.from(0).to(10)
  end

  it "limits value that can be put on a card" do
    max_balance = Oystercard::MAX_CARD_LIMIT
    expect{ subject.top_up(max_balance + 1) }.to raise_error(RuntimeError, /Balance/)
  end

  it "is card in transit?" do
    expect(subject).not_to be_in_journey
  end

  it "deosn't allow to enter with insufficient funds" do
    expect{subject.touch_in(a_station)}.to raise_error(RuntimeError, /Insufficient/)
  end

describe "Tests on topped up card" do

  subject(:t_card) {described_class.new(Oystercard::MIN_FARE)}

  it "changes it's in_journey? status on touching in" do
    t_card.touch_in(a_station)
    expect(t_card).to be_in_journey
  end

  it "changes it's in_journey? status on touching out" do
    t_card.touch_in(a_station)
    t_card.touch_out
    expect(t_card).not_to be_in_journey
  end

  it "deducts money from the card upon touch out" do
    expect{t_card.touch_out}.to change{t_card.balance}.by(-1)
  end

  it "remembers entry station" do
    t_card.touch_in(a_station)
    expect(t_card.entry_station).to eq a_station
  end

  it "entry station gets set to nill upon touch out" do
    t_card.touch_in(a_station)
    t_card.touch_out
    expect(t_card.entry_station).to eq nil
  end

  it "stores an exit station for a journey" do
    t_card.touch_in(a_station)
    t_card.touch_out(a_station)
    expect(t_card.entry_station[-1]).to include(:in => a_station, :out => a_station)
  end

end
end
