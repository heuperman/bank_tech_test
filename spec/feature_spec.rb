describe 'feature test' do
  let(:account) { Account.new }
  describe 'making deposits' do
    it 'allows the user to make a deposit' do
      expect(account.deposit(100)).to change { account.balance }.by(100)
    end
  end
end
