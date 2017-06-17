# Prints statements to console.
class Print
  attr_reader :transactions

  def self.statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      puts transaction.join(' || ').gsub!("  ", " ")
    end
  end
end
