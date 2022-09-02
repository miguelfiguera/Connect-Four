
require 'colorize'

class Display
    attr_accessor :one,:two,:three,:four,:five,:six,:seven
    attr_accessor :index_one,:index_two,:index_three,:index_four,:index_five,:index_six,:index_seven

    def initialize
        @one= Array.new(6){'o'}
        @index_one=0
        @two= Array.new(6){'o'}
        @index_two=0
        @three=Array.new(6){'o'}
        @index_three=0
        @four=Array.new(6){'o'}
        @index_four=0
        @five=Array.new(6){'o'}
        @index_five=0
        @six=Array.new(6){'o'}
        @index_six=0
        @seven=Array.new(6){'o'}
        @index_seven=0
    end

    def print_display

        <<-HEREDOC

        | #{@one[5]} | #{@two[5]} | #{@three[5]} | #{@four[5]} | #{@five[5]} | #{@six[5]} | #{@seven[5]} |
        | #{@one[4]} | #{@two[4]} | #{@three[4]} | #{@four[4]} | #{@five[4]} | #{@six[4]} | #{@seven[4]} |
        | #{@one[3]} | #{@two[3]} | #{@three[3]} | #{@four[3]} | #{@five[3]} | #{@six[3]} | #{@seven[3]} |
        | #{@one[2]} | #{@two[2]} | #{@three[2]} | #{@four[2]} | #{@five[2]} | #{@six[2]} | #{@seven[2]} |
        | #{@one[1]} | #{@two[1]} | #{@three[1]} | #{@four[1]} | #{@five[1]} | #{@six[1]} | #{@seven[1]} |
        | #{@one[0]} | #{@two[0]} | #{@three[0]} | #{@four[0]} | #{@five[0]} | #{@six[0]} | #{@seven[0]} |

            1     2     3     4     5     6     7  

        HEREDOC
    end

    def changing_array_content(array,current_player,array_index)
        current_player.number == 1 ? array[array_index]='o'.on_yellow : array[array_index]='o'.on_red
        array_index += 1
    end

    def update_display(number,current_player)
        case 
        when number == '1'
            changing_array_content(@one,current_player,@index_one)
        when number == '2'
            changing_array_content(@two,current_player,@index_two)
        when number == '3'
            changing_array_content(@three,current_player,@index_three)
        when number == '4'
            changing_array_content(@four,current_player,@index_four)
        when number == '5'
            changing_array_content(@five,current_player,@index_five)
        when number == '6'
            changing_array_content(@six,current_player,@index_six)
        when number == '7'
            changing_array_content(@seven,current_player,@index_seven)
        end
    end

    print_display
end
