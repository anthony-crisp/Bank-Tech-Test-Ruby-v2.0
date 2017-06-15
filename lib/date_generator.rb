# class DateGenerator - Passes todays date if none is provided
require 'date'

class DateGenerator
  attr_reader :date

  def initialize
    @date = todays_date
  end

  def todays_date
    Date.today.strftime('%d/%m/%Y')
  end
end
