# Logs all transactions to be passed to the printer.
class TransactionLog
  attr_accessor :log

  def initialize
    @log = []
  end

  def log_deposit(amount, date, balance)
    @log << [date.tr('-', '/'), format('%.2f', amount), '', format('%.2f', balance)]
  end

  def log_withdraw(amount, date, balance)
    @log << [date.tr('-', '/'), '', format('%.2f', amount), format('%.2f', balance)]
  end
end
