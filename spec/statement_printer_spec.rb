require 'account'
require 'date_generator'
require 'statement_printer'

RSpec.describe PrintStatement do
  subject(:print_statement) { described_class.new([]) }
  it 'outputs to stdout' do
    expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints formatted statement to stdout' do
    date = DateGenerator.new.todays_date
    @transaction = [[date, 20, '', 20], [date, 10, '', 30]]
    expect { PrintStatement.new(@transaction).print_statement }.to output(
      "date || credit || debit || balance\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || 10 ||  || 30\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || 20 ||  || 20\n"
    ).to_stdout
  end
end
