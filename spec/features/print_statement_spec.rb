# frozen_string_literal: true

require 'account_controller.rb'

describe 'printing statement' do
  let(:account_controller) { AccountController.new }

  it 'user can see statement with details of all previous transactions' do
    account_controller.deposit(500)
    account_controller.withdraw(100)
    account_controller.withdraw(170)
    statement = "date || credit || debit || balance\n"\
                "15/08/2018 || || 170 || 230\n"\
                "15/08/2018 || || 100 || 400\n"\
                "15/08/2018 || 500 || || 500\n"
    expect { account_controller.show_statement }.to output(statement).to_stdout
  end
end
