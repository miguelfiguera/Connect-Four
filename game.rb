require_relative 'board.rb'
require_relative 'Text_module.rb'
require_relative 'players.rb'


class Game
    include Text
    attr_accessor :current_player,:player1,:player2


    def initialize
        @player1=nil
        @player2=nil
        @current_player=@player1
    end

    def greetings_and_prep
        greetings
        the_rules
        @player1=create_player(1)
        @player2=create_player(2)
    end



    def create_player(num)
    choose_your_name_text(num)
    name=gets.chomp
    Players.new(name,num)
    end

    def switch_current_player
        @current_player== @player1 ? @current_player==@player2 : @current_player == @player 1
    end

    def turns
    end

    def
