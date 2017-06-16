# Passes todays date if none is provided
require 'date'

class DateGenerator
  def self.todays_date
    Date.today.strftime('%d/%m/%Y')
  end
end
