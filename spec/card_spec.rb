require 'card'

describe Card do

  it "allows to store money" do
    expect(subject.balance).to eq(0)
  end

  it "adds money to card" do
    expect{ subject.add_funds(10) }.to change{subject.balance}.from(0).to(10)
  end

end
