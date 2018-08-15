# frozen_string_literal: true

require 'account_controller.rb'

describe 'withdrawing money' do
  let(:account_balance) { AccountBalance.new }
  let(:account_controller) do
    AccountController.new(account_balance: account_balance)
  end

  it 'user can make a withdrawal from their account' do
    account_controller.withdraw(100.00)
    expect(account_balance.balance).to be(-100.00)
  end
end
