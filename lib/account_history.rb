# frozen_string_literal: true

# Keeps track of all transactions made.
class AccountHistory
  def initialize
    @transactions = []
  end

  def add_transaction(date, type, amount, balance)
    @transactions.push(date: date, type: type, amount: amount, balance: balance)
  end

  def show_transactions
    @transactions
  end
end
