# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:printer) { double :printer, to_screen: 'ok' }
  let(:account) { Account.new(printer) }

  describe '#deposit' do
    it 'adds the given amount to account balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'adds the deposit to the transaction history' do
      expected_history = [{ date: '14/08/2018',
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
      expected_history = [{ date: '14/08/2018',
                            type: 'debit',
                            amount: 100,
                            balance: -100 }]
      account.withdraw(100)
      expect(account.transaction_history).to eq expected_history
    end
  end

  describe '#show_statement' do
    it 'tells printer to print statement' do
      statement = "date || credit || debit || balance\n"\
                  "14/08/2018 || 400 || || 700\n"\
                  "14/08/2018 || || 200 || 300\n"\
                  '14/08/2018 || 500 || || 500'
      account.deposit(500)
      account.withdraw(200)
      account.deposit(400)
      expect(printer).to receive(:to_screen).with(statement)
      account.show_statement
    end
  end
end
