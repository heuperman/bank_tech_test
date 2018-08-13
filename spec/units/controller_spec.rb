# frozen_string_literal: true

require 'controller.rb'

describe Controller do
  let(:account) { double :account }
  let(:transaction) { double :transaction, new: "test" }
  let(:controller) { Controller.new(account, transaction) }

  describe '#deposit' do
    it 'creates a new transaction' do
      controller.deposit(100)
      expect(transaction).to have_received(:new)
    end
  end
end
