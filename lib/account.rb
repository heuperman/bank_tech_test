# frozen_string_literal: true

require_relative './statement_handler.rb'

# Handles transactions
class Account
  attr_reader :balance, :transactions
  def initialize(statement_handler = StatementHandler, date = nil)
    @statement_handler = statement_handler
    @date = date
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    assert_if_two_decimals('deposit', amount)
    update_balance('credit', amount)
    store_transaction('credit', amount)
  end

  def withdraw(amount)
    assert_if_two_decimals('withdraw', amount)
    update_balance('debit', amount)
    store_transaction('debit', amount)
  end

  def print_statement
    @statement_handler.print_statement(@transactions)
  end

  private

  def assert_if_two_decimals(type, amount)
    message = "Cannot #{type}: please enter amount with two decimals"
    raise message unless amount.round(2) == amount
  end

  def update_balance(type, amount)
    type == 'credit' ? @balance += amount : @balance -= amount
  end

  def store_transaction(type, amount)
    @transactions.push(
      date: @date || Time.now.strftime('%d/%m/%Y'),
      type: type,
      amount: amount,
      balance: @balance
    )
  end
end
