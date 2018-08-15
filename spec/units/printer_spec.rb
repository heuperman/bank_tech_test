# frozen_string_literal: true

require 'printer.rb'

describe Printer do
  let(:printer) { Printer }

  describe '#print_statement' do
    it 'prints date, type, amount resulting balance of transactions' do
      statement = "date || credit || debit || balance\n"\
                  "13/08/2018 || || 170.00 || 230.00\n"\
                  "13/08/2018 || || 100.00 || 400.00\n"\
                  "13/08/2018 || 500.00 || || 500.00\n"
      expect { printer.to_screen(statement) }.to output(statement).to_stdout
    end
  end
end
