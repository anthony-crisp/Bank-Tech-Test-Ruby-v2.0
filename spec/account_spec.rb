require 'account'

RSpec.describe Account do
  subject(:account) { described_class.new }

  it 'initializes with with a balance of 0' do
    expect(subject.balance.current_balance).to eq(0)
  end

  describe '#deposit' do
    it 'can recieve a deposit of 10' do
      expect { subject.deposit(10) }.to change { subject.balance.current_balance }.by 10
    end

    it 'can recieve multiple deposits' do
      subject.deposit(10)
      subject.deposit(30)
      expect(subject.balance.current_balance).to eq 40
    end
  end

  describe '#withdraw' do
    it 'can be debited by 10' do
      subject.deposit(100)
      expect { subject.withdraw(10) }.to change { subject.balance.current_balance }.by(-10)
    end

    it 'can be debited multiple times' do
      subject.deposit(100)
      subject.withdraw(10)
      subject.withdraw(50)
      expect(subject.balance.current_balance).to eq 40
    end

    it 'does not allow withdrawal if balance is less than minimum balance' do
      error = 'Insuficient funds in account.'
      expect { subject.withdraw(10) }.to raise_error error
    end
  end
end
