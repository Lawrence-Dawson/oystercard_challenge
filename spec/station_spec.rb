require 'station'

describe Station do

  subject(:station) {described_class.new("Bank")}

  it 'returns station name' do
    expect(subject.name).to eq("Bank")
  end

  it 'returns zone' do
    expect(subject.zone).to eq(1)
  end
end
