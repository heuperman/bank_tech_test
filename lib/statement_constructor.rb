# frozen_string_literal: true

# Turns passed list of transactions into statement
class StatementConstructor
  def self.construct(transactions)
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
    line_array = [
      transaction[:date], '||', '||', '||',
      format('%0.2f', transaction[:balance])
    ]
    column_to_insert_amount = transaction[:type] == 'credit' ? 2 : 3
    line_array.insert(
      column_to_insert_amount,
      format('%0.2f', transaction[:amount])
    )
    line_array.join(' ')
  end

  private_class_method :add_transactions, :construct_statement_line
end
