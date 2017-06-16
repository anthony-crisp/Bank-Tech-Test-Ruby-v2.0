require_relative 'balance'
require_relative 'transaction_log'
require_relative 'date_generator'
require_relative 'statement_printer'

class Account
  attr_reader :balance

  def initialize
    @balance = Balance.new
    @transactions = TransactionLog.new
  end

  def deposit(amount, date = DateGenerator.todays_date)
    @balance.money_in(amount)
    @transactions.log_deposit(amount, date, @balance.current_balance)
  end

  def withdraw(amount, date = DateGenerator.todays_date)
    @balance.money_out(amount)
    @transactions.log_withdraw(amount, date, @balance.current_balance)
  end

  def print_statement
    PrintStatement.new(@transactions.log).print_statement
  end

end
