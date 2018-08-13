# frozen_string_literal: true

require 'account.rb'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'adds the given amount to account balance' do
      expect{ account.deposit(100) }.to change { account.balance }.by(100)
    end
  end
end
