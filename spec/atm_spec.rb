
require './lib/atm.rb'
describe Atm do
    let(:account) { instance_double('Account', pin_code: '1234')} #instance double creates "fake account"

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end
    
    it 'has 1000 on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'reject withdrawl if account has insufficient funds' do
        expected_output = {status: false, message: 'insufficient funds', date: Date.today}
        expect(subject.withdrawl(105, '1234', account)).to eq expected_output
    end

    it 'funds reduced at withdrawl' do
        subject.withdrawl(50, '1234', account)
        expect(subject.funds).to eq 950
    end

    it 'allow withdrawl if the account has enough balance.' do
        expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
        expect(subject.withdrawl(45, '1234', account)).to eq expected_output
    end

    it 'reject withdrawl if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today}
        expect(subject.withdrawl(100, '1234', account)).to eq expected_output
    end
    
end


