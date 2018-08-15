# frozen_string_literal: true

require 'account.rb'

describe 'features' do
  let(:statement_constructor) { StatementConstructor }
  let(:account) { Account.new(StatementConstructor, '13/08/2018') }
  describe 'depositing money' do
    it 'user can make a deposit into their account' do
      expect { account.deposit(103.20) }.to change { account.balance }.by(103.20)
    end
  end

  describe 'withdrawing money' do
    it 'user can make a withdrawal from their account' do
      expect { account.withdraw(300.95) }.to change { account.balance }.by(-300.95)
    end
  end

  describe 'printing statement' do
    it 'user can see statement with details of all previous transactions' do
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
