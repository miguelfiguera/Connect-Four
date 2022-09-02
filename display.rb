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

        <<-HEREDOC

        | #{@one[6]} | #{@two[6]} | #{@three[6]} | #{@four[6]} | #{@five[6]} | #{@six[6]} | #{@seven[6]} |
        | #{@one[5]} | #{@two[5]} | #{@three[5]} | #{@four[5]} | #{@five[5]} | #{@six[5]} | #{@seven[5]} |
        | #{@one[4]} | #{@two[4]} | #{@three[4]} | #{@four[4]} | #{@five[4]} | #{@six[4]} | #{@seven[4]} |
        | #{@one[3]} | #{@two[3]} | #{@three[3]} | #{@four[3]} | #{@five[3]} | #{@six[3]} | #{@seven[3]} |
        | #{@one[2]} | #{@two[2]} | #{@three[2]} | #{@four[2]} | #{@five[2]} | #{@six[2]} | #{@seven[2]} |
        | #{@one[1]} | #{@two[1]} | #{@three[1]} | #{@four[1]} | #{@five[1]} | #{@six[1]} | #{@seven[1]} |

            1     2     3     4     5     6     7  

        HEREDOC
    end

    def changing_array_content(array,current_player)
        current_player.number == 1 ? #puts 'o' on yellow : #puts 'o'  on red
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
