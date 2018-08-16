# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:statement_handler) do
    double :statement_handler,
           construct: "date || credit || debit || balance\n"\
                      "13/08/2018 || || 170.00 || 230.00\n"\
                      "13/08/2018 || || 100.00 || 400.00\n"\
                      '13/08/2018 || 500.00 || || 500.00'
  end

  let(:account) { Account.new(statement_handler, '15/08/2018') }

  describe '#deposit' do
    it 'raises an error when passed an amount with more than two decimals' do
      message = 'Cannot deposit: please enter amount with two decimals'
      expect { account.deposit(500.003) }.to raise_error(message)
    end

    it 'adds the amount to the account balance' do
      expect { account.deposit(500.00) }.to change { account.balance }.by(500)
    end

    it 'stores the transaction in an array' do
      expect { account.deposit(300.00) }.to change { account.transactions }
        .to([amount: 300.0, balance: 300.0, date: '15/08/2018', type: 'credit'])
    end
  end

  describe '#withdraw' do
    it 'raises an error when passed an amount with more than two decimals' do
      message = 'Cannot withdraw: please enter amount with two decimals'
      expect { account.withdraw(500.003) }.to raise_error(message)
    end

    it 'subtracts the account from the account balance' do
      expect { account.withdraw(300.00) }.to change { account.balance }.by(-300)
    end

    it 'stores the transaction in an array' do
      expect { account.withdraw(600.00) }.to change { account.transactions }
        .to([amount: 600.0, balance: -600.0, date: '15/08/2018', type: 'debit'])
    end
  end

  describe '#print_statement' do
    it 'tells statement contstructor print statement of transactions' do
      account.deposit(500.00)
      account.withdraw(100.00)
      account.withdraw(170.00)
      transactions = [
        { amount: 500.0, balance: 500.0, date: '15/08/2018', type: 'credit' },
        { amount: 100.0, balance: 400.0, date: '15/08/2018', type: 'debit' },
        { amount: 170.0, balance: 230.0, date: '15/08/2018', type: 'debit' }
      ]
      expect(statement_handler).to receive(:print_statement).with(transactions)
      account.print_statement
    end
  end
end
