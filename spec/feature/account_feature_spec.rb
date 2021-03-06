require 'account'
# Given a client makes a deposit of 1000 on 10-01-2012
# And a deposit of 2000 on 13-01-2012
# And a withdrawal of 500 on 14-01-2012
# When she prints her bank statement Then she would see

# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00

RSpec.describe Account do
  subject(:account) { described_class.new }
  it 'reproduces the statement as shown if given corresponding inputs' do
    subject.deposit(1000, '10-01-2012')
    subject.deposit(2000, '13-01-2012')
    subject.withdraw(500, '14-01-2012')
    expect { subject.statement }.to output(
      "date || credit || debit || balance\n" \
      "14/01/2012 || || 500.00 || 2500.00\n" \
      "13/01/2012 || 2000.00 || || 3000.00\n" \
      "10/01/2012 || 1000.00 || || 1000.00\n"
    ).to_stdout
  end
end
