require 'date'
require 'date_generator'

RSpec.describe DateGenerator do
  subject(:date) { described_class.new.todays_date }
  it 'gives todays date formatted dd/mm/yyyy' do
    expect(subject).to eq Date.today.strftime('%d/%m/%Y')
  end
end
