# frozen_string_literal: true

require 'account_history.rb'

describe AccountHistory do
  let(:account_history) { AccountHistory.new }

  describe '#add_transaction' do
    it 'adds the transaction to the transactions array' do
      transaction = {
        date: '09/11/2001',
        type: 'credit',
        amount: '400',
        balance: '600'
      }
      account_history.add_transaction(
        '09/11/2001',
        'credit',
        '400',
        '600'
      )
      expect(account_history.show_transactions).to contain_exactly(transaction)
    end
  end
end
