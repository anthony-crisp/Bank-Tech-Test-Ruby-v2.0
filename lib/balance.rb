# Keeps track of the balance as money comes in and out.

class Balance
  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
  end

  def money_in(ammount)
    @current_balance += ammount
  end

  def money_out(ammount)
    raise 'Insuficient funds in account.' if @current_balance <= 0
    @current_balance -= ammount
  end
end
