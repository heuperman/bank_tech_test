# frozen_string_literal: true

require 'statement_constructor.rb'
require 'printer.rb'
require 'account_history.rb'
require 'account_balance.rb'

# Let's user control the other components of the app
class AccountController
  def initialize(params = {})
    @printer = params.fetch(:printer, Printer)
    @statement_constructor = params.fetch(
      :statement_constructor, StatementConstructor
    )
    @account_history = params.fetch(:account_history, AccountHistory.new)
    @account_balance = params.fetch(:account_balance, AccountBalance.new)
    @date = params.fetch(:date, Time.now.strftime('%d/%m/%Y'))
  end

  def deposit(amount)
    balance = @account_balance.update('credit', amount)
    @account_history.add_transaction(@date, 'credit', amount, balance)
  end

  def withdraw(amount)
    balance = @account_balance.update('debit', amount)
    @account_history.add_transaction(@date, 'debit', amount, balance)
  end

  def show_statement
    transactions = @account_history.show_transactions
    statement = @statement_constructor.construct(transactions)
    @printer.to_screen(statement)
  end
end
