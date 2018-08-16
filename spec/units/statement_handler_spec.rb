# frozen_string_literal: true

require 'statement_handler.rb'

describe StatementHandler do
  describe '.construct' do
    it 'returns array of strings containing statement '\
    'header and list of transactions' do
      transactions = [{
        date: '07/04/2017', type: 'credit',
        amount: 200.00, balance: 400.00
      }]
      statement =
        "date || credit || debit || balance\n"\
        "07/04/2017 || 200.00 || || 400.00\n"
      expect { StatementHandler.print_statement(transactions) }
        .to output(statement).to_stdout
    end
  end
end
