# frozen_string_literal: true

require 'account_controller.rb'

describe 'depositing' do
  let(:account_balance) { AccountBalance.new }
  let(:account_controller) do
    AccountController.new(account_balance: account_balance)
  end

  it 'user can make a deposit into their account' do
    account_controller.deposit(100.00)
    expect(account_balance.balance).to be(100.00)
  end
end
