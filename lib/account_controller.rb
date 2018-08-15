# frozen_string_literal: true

require 'statement_constructor.rb'
require 'printer.rb'
require 'account_history.rb'
require 'account_balance.rb'

# Let's user control the other components of the app
class AccountController
  def initialize(
    printer = Printer.new,
    statement_constructor = StatementConstructor.new,
    account_history = AccountHistory.new,
    account_balance = AccountBalance.new,
    date = Time.now.strftime('%d/%m/%Y')
  )
    @printer = printer
    @statement_constructor = statement_constructor
    @account_history = account_history
    @account_balance = account_balance
    @date = date
  end

  def deposit(amount)
    assert_if_two_decimals('deposit', amount)
    balance = @account_balance.update('credit', amount)
    @account_history.add_transaction(@date, 'credit', amount, balance)
  end

  def withdraw(amount)
    assert_if_two_decimals('withdraw', amount)
    balance = @account_balance.update('debit', amount)
    @account_history.add_transaction(@date, 'debit', amount, balance)
  end

  def show_statement
    transactions = @account_history.show_transactions
    statement = @statement_constructor.construct(transactions)
    @printer.to_screen(statement)
  end

  private

  def assert_if_two_decimals(type, amount)
    message = "Cannot #{type}: please enter amount with two decimals"
    raise message unless amount.round(2) == amount
  end
end
