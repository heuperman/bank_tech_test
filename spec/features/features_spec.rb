# frozen_string_literal: true

require 'account_controller.rb'

describe 'features' do
  describe 'depositing money' do
    let(:account_balance) { AccountBalance.new }
    let(:account_controller) do
      AccountController.new(account_balance: account_balance)
    end

    it 'user can make a deposit into their account' do
      account_controller.deposit(100.00)
      expect(account_balance.balance).to be(100.00)
    end
  end

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

  describe 'printing statement' do
    let(:account_controller) { AccountController.new }

    it 'user can see statement with details of all previous transactions' do
      account_controller.deposit(500.00)
      account_controller.withdraw(100.00)
      account_controller.withdraw(170.00)
      date = Time.now.strftime('%d/%m/%Y')
      statement = "date || credit || debit || balance\n"\
                  "#{date} || || 170.00 || 230.00\n"\
                  "#{date} || || 100.00 || 400.00\n"\
                  "#{date} || 500.00 || || 500.00\n"
      expect { account_controller.show_statement }.to output(statement).to_stdout
    end
  end
end
