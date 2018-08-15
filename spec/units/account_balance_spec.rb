# frozen_string_literal: true

require 'account_balance.rb'

describe AccountBalance do
  let(:account_balance) { AccountBalance.new }

  describe '#update' do
    describe 'when type is credit' do
      it 'increases balance by given amount' do
        expect { account_balance.update('credit', 200) }
          .to change { account_balance.balance }.by(200)
      end
    end
    describe 'when type is debit' do
      it 'decreases balance by given amount' do
        expect { account_balance.update('debit', 500) }
          .to change { account_balance.balance }.by(-500)
      end
    end
  end
end
