# Prints statements to console.
require_relative 'transaction_log'

class PrintStatement
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts transaction.join(' || ')
    end
  end
end
