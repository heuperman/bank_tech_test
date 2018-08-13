# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'adds the given amount to account balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'adds the deposit to the transaction history' do
      expected_history = [{ date: '13/08/2018',
                            type: 'credit',
                            amount: 100,
                            balance: 100 }]
      account.deposit(100)
      expect(account.transaction_history).to eq expected_history
    end
  end

  describe '#withdraw' do
    it 'reduces the account balance by the given amount' do
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end

    it 'adds the withdrawal to the transaction history' do
      expected_history = [{ date: '13/08/2018',
                            type: 'debit',
                            amount: 100,
                            balance: -100 }]
      account.withdraw(100)
      expect(account.transaction_history).to eq expected_history
    end
  end

  describe '#show_statement' do
    it 'shows date, type, amount resulting balance of transactions' do
      expected_statement = "date || credit || debit || balance\n"\
                           "13/08/2018 || || 170 || 230\n"\
                           "13/08/2018 || || 100 || 400\n"\
                           '13/08/2018 || 500 || || 500'
      account.deposit(500)
      account.withdraw(100)
      account.withdraw(170)
      expect(account.show_statement).to eq expected_statement
    end
  end
end
