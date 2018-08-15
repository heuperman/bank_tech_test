# frozen_string_literal: true

# Keep track of how much money is in the account
class AccountBalance
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def update(type, amount)
    type == 'credit' ? @balance += amount : @balance -= amount
  end
end
