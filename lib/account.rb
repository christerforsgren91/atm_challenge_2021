require 'date'

class Account 

    attr_accessor :exp_date
    attr_accessor :pin_code

    STANDARD_VALIDILITY_YRS = 5 

    def initialize
        @exp_date = '03/26'
    end

    def initialize
        @pin_code = rand(1000..9999)
    end

       
end

def set_expire_date
    
    Date.today.next_year(STANDARD_VALIDILITY_YRS).strftime('%m/%y')
    
end




