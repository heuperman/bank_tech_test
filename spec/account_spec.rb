# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'adds the given amount to account balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'adds the deposit to the transaction history' do
      expected_history = [{ amount: 100, balance: 100, type: 'credit' }]
      account.deposit(100)
      expect(account.transaction_history).to eq expected_history
    end
  end

  describe '#withdraw' do
    it 'reduces the account balance by the given amount' do
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end

    it 'adds the withdrawal to the transaction history' do
      expected_history = [{ amount: 100, balance: -100, type: 'debit' }]
      account.withdraw(100)
      expect(account.transaction_history).to eq expected_history
    end
  end

  describe '#print_statement' do
    it 'prints statement showing deposits, withdrawals and resulting balance' do
      expected_statement = "credit || debit || balance\n500 || || 500\n"\
                  " || 100 || 400\n || 170 || 230"
      account.deposit(500)
      account.withdraw(100)
      account.withdraw(170)
      expect(account.print_statement).to eq expected_statement
    end
  end
end
