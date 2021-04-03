require './lib/account.rb'
require './lib/atm.rb'


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

    def withdraw(args = {})
        if @account == nil
            raise RuntimeError, 'No account'
        else
            withdraw_funds(args)
        end
    end
end

    private 

    def withdraw_funds(args)
            args[:atm] == nil ? missing_atm : atm = args[:atm]
            account = @account
            amount = args[:amount]
            pin = args[:pin] 
            account_status = @account_status
            response = atm.withdraw(amount, pin, account, account_status) 
            response[:status] == true ? increase_cash(amount) : response
            response
        end

    def increase_cash(amount)
        @cash += amount
    end

    def set_name(name)
        name == nil ? missing_name : name
    end

    def missing_name
        raise ArgumentError, 'A name is required'
    end

    def pin 
        @pin = @pin_code
    end


    


