require 'account'
require 'statement_printer'

RSpec.describe PrintStatement do
  subject(:print_statement) { described_class.new([]) }
  it 'outputs to stdout' do
    expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end
end
