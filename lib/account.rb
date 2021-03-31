require 'date'

class Account 

    attr_accessor :exp_date, :account_status 
    attr_reader :pin_code, :owner

    STANDARD_VALIDILITY_YRS = 5 

    def initialize(attrs = {})
        @exp_date = '03/26'
        @pin_code = rand(1000..9999)
        @account_status = :active
        set_owner(attrs[:owner])
        
    end

    def  deactivate
        @account_status = :deactivated
    end

    def set_expire_date
        
        Date.today.next_year(STANDARD_VALIDILITY_YRS).strftime('%m/%y')
        
    end
end


private

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An account owner is required"
    end










