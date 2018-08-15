# frozen_string_literal: true

require 'statement_constructor.rb'

describe StatementConstructor do
  describe '.construct' do
    it 'returns array of strings containing statement '\
    'header and list of transactions' do
      transactions = [{
        date: '07/04/2017',
        type: 'credit',
        amount: 200,
        balance: 400
      }]
      output = [
        'date || credit || debit || balance',
        '07/04/2017 || 200 || || 400'
      ]
      expect(StatementConstructor.construct(transactions)).to eq output
    end
  end
end