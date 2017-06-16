require_relative 'balance'
require_relative 'transaction_log'
require_relative 'date_generator'
require_relative 'statement_printer'

class Account
  attr_reader :balance

  def initialize
    @balance = Balance.new
    @transactions = TransactionLog.new.transactions
  end

  def deposit(amount, date = DateGenerator.new.date)
    @balance.money_in(amount)
    log_deposit(amount, date)
  end

  def withdraw(amount, date = DateGenerator.new.date)
    @balance.money_out(amount)
    log_withdraw(amount, date)
  end

  def print_statement
    PrintStatement.new(@transactions).print_statement
  end

  private

  def log_deposit(amount, date)
    @transactions << [date, format('%.2f', amount), '', format('%.2f', @balance.current_balance)]
  end

  def log_withdraw(amount, date)
    @transactions << [date, '', format('%.2f', amount), format('%.2f', @balance.current_balance)]
  end
end
