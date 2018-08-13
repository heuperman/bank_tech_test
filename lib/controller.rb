# frozen_string_literal: true

class Controller
  def initialize(account, transaction)
    @account = account
    @transaction = transaction
  end

  def deposit(amount)
    @transaction.new(type: 'credit', amount: amount)
  end
end
