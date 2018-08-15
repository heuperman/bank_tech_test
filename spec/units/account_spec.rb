# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:statement_constructor) do
    double :statement_constructor,
           construct: "date || credit || debit || balance\n"\
                      "13/08/2018 || || 170.00 || 230.00\n"\
                      "13/08/2018 || || 100.00 || 400.00\n"\
                      '13/08/2018 || 500.00 || || 500.00'
  end

  let(:account) { Account.new(statement_constructor) }

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
    it 'prints out a statement containing all previous transactions' do
      account.deposit(500.00)
      account.withdraw(100.00)
      account.withdraw(170.00)
      statement = "date || credit || debit || balance\n"\
                  "13/08/2018 || || 170.00 || 230.00\n"\
                  "13/08/2018 || || 100.00 || 400.00\n"\
                  "13/08/2018 || 500.00 || || 500.00\n"
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end
