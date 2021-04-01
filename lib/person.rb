require './lib/account.rb'


class Person
    
    attr_accessor :cash, :account, :name
    attr_reader 

    def initialize (attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
    end
    
    def noname_error
    raise 'A name is required'
    end

    def create_account
        @account = Account.new(owner: self)
    end

end

private 

def set_name(name)
    name == nil ? missing_name : name
end

def missing_name
    raise ArgumentError, 'A name is required'
end
#def missing_account
#    raise "An account is required"
#end
