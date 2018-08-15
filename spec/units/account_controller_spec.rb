# frozen_string_literal: true

require 'account_controller.rb'

describe AccountController do
  let(:printer) { double :printer, to_screen: 'ok' }
  let(:statement_constructor) do
    double :statement_constructor, construct: 'statement'
  end
  let(:account_history) do
    double :account_history,
           add_transaction: 0,
           show_transactions: 'transactions'
  end
  let(:account_balance) { double :account_balance, update: 0 }
  let(:account_controller) do
    AccountController.new(
      printer: printer,
      statement_constructor: statement_constructor,
      account_history: account_history,
      account_balance: account_balance,
      date: '09/11/2001'
    )
  end

  describe '#deposit' do
    it 'tells the account balance to update' do
      expect(account_balance).to receive(:update).with('credit', 500)
      account_controller.deposit(500)
    end

    it 'tells the account history to add the transaction' do
      expect(account_history).to receive(:add_transaction)
        .with('09/11/2001', 'credit', 300, 0)
      account_controller.deposit(300)
    end
  end

  describe '#withdraw' do
    it 'tells the account balance to update' do
      expect(account_balance).to receive(:update).with('debit', 100)
      account_controller.withdraw(100)
    end

    it 'tells the account history to add the transaction' do
      expect(account_history).to receive(:add_transaction)
        .with('09/11/2001', 'debit', 600, 0)
      account_controller.withdraw(600)
    end
  end

  describe '#show_statement' do
    it 'tells the account histroy to return all transactions' do
      expect(account_history).to receive(:show_transactions)
      account_controller.show_statement
    end

    it 'tells the statement constructor to make a statement' do
      expect(statement_constructor).to receive(:construct).with('transactions')
      account_controller.show_statement
    end

    it 'tells the printer to print the statement' do
      expect(printer).to receive(:to_screen).with('statement')
      account_controller.show_statement
    end
  end
end
