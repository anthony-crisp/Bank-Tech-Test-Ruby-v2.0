# Keeps track of the balance as money comes in and out.

class Balance
  attr_reader :current_balance

  def initialize
    @current_balance = 0
  end

  def money_in(amount)
    @current_balance += amount
  end

  def money_out(amount)
    raise 'Insuficient funds in account.' if @current_balance <= 0
    @current_balance -= amount
  end
end
