# frozen_string_literal: true

# Builds and prints statements
class StatementHandler
  def self.print_statement(transactions)
    statement = construct_statement(transactions)
    puts statement
  end

  def self.construct_statement(transactions)
    statement = ['date || credit || debit || balance']
    add_transactions(statement, transactions)
  end

  def self.add_transactions(statement, transactions)
    transactions.reverse_each do |transaction|
      statement_line = construct_statement_line(transaction)
      statement.push(statement_line)
    end
    statement
  end

  def self.construct_statement_line(transaction)
    date = transaction[:date]
    amount = format('%0.2f', transaction[:amount])
    balance = format('%0.2f', transaction[:balance])
    if transaction[:type] == 'credit'
      "#{date} || #{amount} || || #{balance}"
    else
      "#{date} || || #{amount} || #{balance}"
    end
  end

  private_class_method :construct_statement,
                       :add_transactions,
                       :construct_statement_line
end
