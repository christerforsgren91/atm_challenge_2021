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

    def no_account_error
        raise 'No Account'
    end


    def create_account
        @account = Account.new(owner: self)
    end

    def deposit (amount) 
        if @account == nil
            raise RuntimeError, 'No account'
        else
        @cash -= amount
        @account.balance += amount
        end
    end

end

private 

def set_name(name)
    name == nil ? missing_name : name
end

def missing_name
    raise ArgumentError, 'A name is required'
end



