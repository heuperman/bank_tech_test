# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'adds the given amount to account balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe '#withdraw' do
    it 'reduces the account balance by the given amount' do
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end
  end

  describe '#print_statement' do
    it 'prints statement showing deposits, withdrawals and resulting balance' do
      account.deposit(500)
      account.withdraw(100)
      account.withdraw(170)
      statement = "credit || debit || balance\n500 || || 500\n\
        || 100 || 400\n|| 170 || 230"
      expect(account.print_statement).to eq statement
    end
  end
end
