# frozen_string_literal: true

# Keeps track of and updates the account balance
class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    update_balance('credit', amount)
    add_to_history('credit', amount)
  end

  def withdraw(amount)
    update_balance('debit', amount)
    add_to_history('debit', amount)
  end

  def print_statement
    statement_array = construct_statement_array
    statement_array.join("\n")
  end

  private

  def update_balance(type, amount)
    type == 'credit' ? @balance += amount : @balance -= amount
  end

  def add_to_history(type, amount)
    @transaction_history.push(type: type, amount: amount, balance: @balance)
  end

  def construct_statement_array
    @statement = ['credit || debit || balance']
    add_transactions(@statement)
  end

  def add_transactions(statement)
    @transaction_history.each do |transaction|
      statement_line = construct_statement_line(transaction)
      statement.push(statement_line)
    end
    statement
  end

  def construct_statement_line(transaction)
    if transaction[:type] == 'credit'
      "#{transaction[:amount]} || || #{transaction[:balance]}"
    else
      " || #{transaction[:amount]} || #{transaction[:balance]}"
    end
  end
end
