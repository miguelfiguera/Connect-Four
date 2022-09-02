require_relative 'squares.rb'
require_relative 'Text_module.rb'
require_relative 'players.rb'


class Game
    include Text
    attr_accessor :current_player,:player1,:player2,:display, :current_node


    def initialize
        @player1=nil
        @player2=nil
        @display= Display.new
        @current_player=@player1
        @current_node= nil
    end

#GAME PREP

    def greetings_and_prep
        greetings
        the_rules
        @player1=create_player(1)
        @player2=create_player(2)
        @display.print_display
    end


    #Creating players, Display, Squares/nodes
    def create_player(num)
    choose_your_name_text(num)
    name=gets.chomp
    Players.new(name,num)
    end

    #THE TURNS
    def turns
        loop do
            @display.print_display
            players_turn(@current_player)
            num=@current_player.players_selection
            @current_node= create_square(@current_player,num)
            @display.update_display(num.to_s)
            @display.print_display

        break if victory?(@current_node,@current_player)
             swap_current_player
        end
        victory(@current_player)
    end



     #turn control
    def swap_current_player
      @current_player == @player1 ? @current_player==@player2 : @current_player == @player1
    end


end