require 'card'

describe Card do

  it "allows to store money" do
    expect(subject.balance).to eq(0)
  end

  it "adds money to card" do
    expect{subject.add(10)}.to change{subject.balance}.from(0).to(10)
  end

  it "limits value that can be put on a card" do
    expect{ subject.add(100) }.to raise_error("Max top up value exceeded")
  end

  it "deduct money from card balance" do
    subject.add(10)
    expect{ subject.deduct(10) }.to change{subject.balance}.from(10).to(0)
  end



end
