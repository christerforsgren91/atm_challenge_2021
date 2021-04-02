require './lib/person.rb'
require './lib/atm.rb'

describe Person do
    
    subject {Person.new(name: 'Thomas')}

    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end

    it 'expect to raise an error if no name is set' do
        expect{subject.noname_error}.to raise_error 'A name is required'
    end

    it 'is expected to have :cash attribute with the value of 0 on initialize' do
        expect(subject.cash).to eq 0
    end

    it 'is expected to have an :account attribute' do 
        expect(subject.account).to be nil
    end

    describe 'can create an Account' do
        
        before {subject.create_account}
        it 'of Account class' do
            expect(subject.account).to be_an_instance_of Account
        end
        
        it 'with himself as an owner' do
            expect(subject.account.owner).to be subject
        end
    end

    describe 'can manage funds if an account has been created' do
        let(:atm) { Atm.new }
        before {subject.create_account}
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end

        it 'funds are added to the account balance - deducted from cash' do
            subject.cash = 100
            subject.deposit(100)
            expect(subject.account.balance).to be 100
            expect(subject.cash).to be 0
        end

    end

    describe 'can not manage funds if no account created' do
        it 'can\'t deposit funds' do
            expect {subject.deposit(100)}.to raise_error(RuntimeError, 'No account')
        end
    end
end