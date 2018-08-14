# frozen_string_literal: true

# Keeps track of and updates the account balance
class Account
  attr_reader :balance, :transaction_history

  def initialize(printer)
    @balance = 0
    @transaction_history = []
    @printer = printer
  end

  def deposit(amount)
    update_balance('credit', amount)
    add_to_history('credit', amount)
  end

  def withdraw(amount)
    update_balance('debit', amount)
    add_to_history('debit', amount)
  end

  def show_statement
    statement_array = construct_statement_array
    statement = statement_array.join("\n")
    @printer.to_screen(statement)
  end

  private

  def update_balance(type, amount)
    type == 'credit' ? @balance += amount : @balance -= amount
  end

  def add_to_history(type, amount)
    date = Time.now.strftime('%d/%m/%Y')
    @transaction_history.push(date: date,
                              type: type,
                              amount: amount,
                              balance: @balance)
  end

  def construct_statement_array
    @statement = ['date || credit || debit || balance']
    add_transactions(@statement)
  end

  def add_transactions(statement)
    @transaction_history.reverse_each do |transaction|
      statement_line = construct_statement_line(transaction)
      statement.push(statement_line)
    end
    statement
  end

  def construct_statement_line(transaction)
    line_array = [transaction[:date], '||', '||', '||', transaction[:balance]]
    column_to_insert_amount = transaction[:type] == 'credit' ? 2 : 3
    line_array.insert(column_to_insert_amount, transaction[:amount])
    line_array.join(' ')
  end
end
