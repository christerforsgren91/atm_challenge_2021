
require './lib/atm.rb'
describe Atm do
    let(:account) { instance_double('Account')} 

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end
    
    it 'has 1000 on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'funds are withdrew at withdrawl' do
        subject.withdrawl 50
        expect(subject.funds).to eq 950
    end

    it 'allow withdrawl if the account has enough balance.' do
        expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
        expect(subject.withdrawl(45, account)).to eq expected_output
    end








end

