# frozen_string_literal: true

# Keeps track of and updates the account balance
class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.push(type: 'credit', amount: amount, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history.push(type: 'debit', amount: amount, balance: @balance)
  end

  def print_statement
    @statement = ['credit || debit || balance']
    @transaction_history.each do |transaction|
      if transaction[:type] == 'credit'
        statement_line = "#{transaction[:amount]} || || #{transaction[:balance]}"
      else
        statement_line = " || #{transaction[:amount]} || #{transaction[:balance]}"
      end
      @statement.push(statement_line)
    end
    @statement.join("\n")
  end
end
