require 'account'
require 'date_generator'
require 'statement_printer'

RSpec.describe Print do
  subject(:print_statement) { described_class.statement([]) }
  it 'outputs to stdout' do
    expect { subject }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints formatted statement to stdout' do
    date = DateGenerator.todays_date
    subject << [date, 20, '', 20] << [date, 10, '', 30]
    expect { Print.statement(subject) }.to output(
      "date || credit || debit || balance\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || 10 || || 30\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || 20 || || 20\n"
    ).to_stdout
  end
end
