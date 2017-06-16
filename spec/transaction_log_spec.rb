require 'transaction_log'

RSpec.describe TransactionLog do
  subject(:TrancactionLog) { described_class.new }

  it 'initializes with with no transactions' do
    expect(subject.log).to eq []
  end
end
