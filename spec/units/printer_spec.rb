# frozen_string_literal: true

require 'printer.rb'

describe Printer do
  let(:printer) { Printer }

  describe '#print_statement' do
    it 'prints date, type, amount resulting balance of transactions' do
      statement = "date || credit || debit || balance\n"\
                  "13/08/2018 || || 170 || 230\n"\
                  "13/08/2018 || || 100 || 400\n"\
                  "13/08/2018 || 500 || || 500\n"
      expect { printer.to_screen(statement) }.to output(statement).to_stdout
    end
  end
end
