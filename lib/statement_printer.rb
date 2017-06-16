# Prints statements to console.
class PrintStatement
  attr_reader :transactions

  def self.print_statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts transaction.join(' || ').gsub!("  ", " ")
    end
  end
end
