# Logs all transactions to be passed to the printer.
class TransactionLog
  attr_accessor :transactions

  def initialize
    @transactions = []
  end
end
