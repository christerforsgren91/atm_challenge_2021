require './lib/atm.rb'


describe Atm do
    let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/21', account_status: :active)} 

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end
    
    it 'has 1000 on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'reject withdrawl if account has insufficient funds' do
        expected_output = {status: false, message: 'insufficient funds', date: Date.today}
        expect(subject.withdrawl(105, '1234', account, :active)).to eq expected_output
    end

    it 'funds reduced at withdrawl' do
        subject.withdrawl(50, '1234', account, :active)
        expect(subject.funds).to eq 950
    end

    it 'allow withdrawl if the account has enough balance.' do
        expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
        expect(subject.withdrawl(45, '1234', account, :active)).to eq expected_output
    end

    it 'reject withdrawl if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today}
        expect(subject.withdrawl(100, '1234', account, :active)).to eq expected_output
    end
    it 'reject withdrawl if the pin is wrong' do
        expected_output = { status: false, message: 'wrong pin', date: Date.today}
        expect(subject.withdrawl(50, '9999', account, :active)).to eq expected_output
    end
    it 'reject withdrawl if card is expired' do
        allow(account).to receive(:exp_date).and_return('01/21')
        expected_output = { status: false, message: 'card expired', date: Date.today}
        expect(subject.withdrawl(6, '1234', account, :active)).to eq expected_output
    end

    it 'reject withdrawl if account is disabled' do
        expected_output = { status: false, message: 'account disabled', date: Date.today}
        expect(subject.withdrawl(6, '1234', account,:disabled)).to eq expected_output
    end
    
end


