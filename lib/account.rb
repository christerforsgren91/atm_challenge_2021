require 'date'

class Account 

    attr_accessor :exp_date, :account_status
    attr_reader :pin_code

    STANDARD_VALIDILITY_YRS = 5 

    def initialize
        @exp_date = '03/26'
        @pin_code = rand(1000..9999)
        @account_status = :active
    end

    def  deactivate
        @account_status = :deactivated
    end

end



def set_expire_date
    
    Date.today.next_year(STANDARD_VALIDILITY_YRS).strftime('%m/%y')
    
end






