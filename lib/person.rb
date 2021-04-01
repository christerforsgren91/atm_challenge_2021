class Person
    
    attr_accessor :name
    
    def initialize
    @name = 'Thomas'
    end
    
    def noname_error
    raise 'A name is required'
    end

end

