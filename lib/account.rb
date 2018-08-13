# frozen_string_literal: true

# Keeps track of and updates the account balance
class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
