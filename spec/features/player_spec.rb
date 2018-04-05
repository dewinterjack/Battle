require 'player'

describe Player do
  subject{ described_class.new('John') }

  it 'Should return the name' do
    expect(subject.name).to eq 'John'
  end
end
