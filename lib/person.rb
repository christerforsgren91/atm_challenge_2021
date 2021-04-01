require './lib/account.rb'


class Person
    
    attr_accessor :cash, :account
    attr_reader :name

    def initialize (attrs = {})
    @name = 'Thomas'
    @cash = 0
    @account = Account.new 
    end
    
    def noname_error
    raise 'A name is required'
    end

end

private 

#def set_account(obj)
#    obj == nil ? missing_account : @account = obj
#end

#def missing_account
#    raise "An account is required"
#end
