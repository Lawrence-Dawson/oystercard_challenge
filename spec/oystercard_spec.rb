require 'oystercard'

describe Oystercard do

  #subject(:subject) {described_class.new}

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

  it "deduct money from card balance" do
    subject.top_up(10)
    expect{ subject.deduct(10) }.to change{subject.balance}.by(-10)
  end

  it "is card in transit?" do
    expect(subject).not_to be_in_journey
  end
describe "Topped up card" do

  subject(:t_card) {described_class.new(Oystercard::MIN_FARE)}

  it "changes it's in_journey? status on touching in" do
    t_card.touch_in
    expect(t_card).to be_in_journey
  end

  it "changes it's in_journey? status on touching out" do
    t_card.touch_in
    t_card.touch_out
    expect(t_card).not_to be_in_journey
  end

  it "deosn't allow to enter with insufficient funds" do
    t_card.deduct(1)
    expect{t_card.touch_in}.to raise_error(RuntimeError, /Insufficient/)
  end

end
end
