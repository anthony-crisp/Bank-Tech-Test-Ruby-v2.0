require 'transaction_log'

RSpec.describe TrancactionLog do
  subject(:TrancactionLog) { described_class.new }

  it 'initializes with with no transactions' do
    expect(subject.transactions).to eq []
  end
end
