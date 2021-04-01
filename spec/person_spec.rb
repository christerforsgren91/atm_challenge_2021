require './lib/person.rb'
require './lib/atm.rb'

describe Person do
    
    #subject {describe_class.new(name: 'Thomas')}

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

    describe ' can creat an Account' do
        
        before {subject.create_account}
        it 'of Account class' do
            expect(subject.account).to be_an_instance_of Account
        end
    end

end