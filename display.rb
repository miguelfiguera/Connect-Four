class Display
    attr_accessor :array

 @@arrays=[]
    def initialize
        @one= Array.new(6){'o'}
        @two= Array.new(6){'o'}
        @three=Array.new(6){'o'}
        @four=Array.new(6){'o'}
        @five=Array.new(6){'o'}
        @six=Array.new(6){'o'}
        @seven=Array.new(6){'o'}
    end

    def print_display

    end

    def update_display(number,current_player)
        case 
        when number == '1'
        when number == '2'
        when number == '3'
        when number == '4'
        when number == '5'
        when number == '6'
        when number == '7'
        end
    end


end
