require 'station'

describe Station do

  subject {described_class.new("Bank", 1)}

  it 'returns station name' do
    expect(subject.name).to eq("Bank")
  end

  it 'returns zone' do
    expect(subject.zone).to eq(1)
  end

end
