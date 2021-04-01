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
end