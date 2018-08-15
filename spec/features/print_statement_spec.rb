# frozen_string_literal: true

require 'account_controller.rb'

describe 'printing statement' do
  let(:account_controller) { AccountController.new }

  it 'user can see statement with details of all previous transactions' do
    account_controller.deposit(500.00)
    account_controller.withdraw(100.00)
    account_controller.withdraw(170.00)
    statement = "date || credit || debit || balance\n"\
                "15/08/2018 || || 170.00 || 230.00\n"\
                "15/08/2018 || || 100.00 || 400.00\n"\
                "15/08/2018 || 500.00 || || 500.00\n"
    expect { account_controller.show_statement }.to output(statement).to_stdout
  end
end
