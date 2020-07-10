require 'rspec'
require_relative '../boggle'
require 'byebug'

RSpec.describe Boggle do
  let(:board) do
    [
     ['z','r','z','z','z'],
     ['z','i','g','u','z'],
     ['z','g','z','p','z'],
     ['z','u','u','z','z'],
     ['z','p','z','z','z']
    ]
  end

  it { expect(described_class.new(board).find_string('rigup')).to include([[1,0], [1,1], [1,2], [1,3], [1,4]]) }
  it { expect(described_class.new(board).find_string('rigup')).to include([[1,0], [1,1], [2,1], [3,1], [3,2]]) }
  it { expect(described_class.new(board).find_string('rigup')).to include([[1,0], [1,1], [1,2], [2,3], [3,2]]) }
  it { expect(described_class.new(board).find_string('rigup')).to include([[1,0], [1,1], [1,2], [2,3], [1,4]]) }
  it { expect(described_class.new(board).find_string('rigup').count).to eq(4) }
end
