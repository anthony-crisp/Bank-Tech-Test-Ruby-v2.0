class Account
  OVER_DRAFT = -10

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    raise 'Insuficient funds in account.' if @balance <= OVER_DRAFT
    @balance -= ammount
  end

end
