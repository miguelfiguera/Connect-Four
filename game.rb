require_relative 'squares.rb'
require_relative 'Text_module.rb'
require_relative 'players.rb'
require"pry-byebug"




class Game
    include Text
    attr_accessor :current_player,:player1,:player2,:display, :current_node

    @@instances=[]

    def initialize
        @player1=nil
        @player2=nil
        @display= Display.new
        @current_player = nil
        @current_node= nil
    end

#GAME PREP

    def greetings_and_prep
        greetings
        the_rules
        @player1=create_player(1)
        @player2=create_player(2)
        @current_player=@player1
        @display.print_display
    end


    #Creating players, Display.
    def create_player(num)
    choose_your_name_text(num)
    name=gets.chomp
    Players.new(name,num)
    end


    #SQUARES CREATION
    def create_square(current_player,num)
        position=create_position(num)
        parents=the_parents_array(position,current_player)
        node= Square.new(current_player,position,parents)
        @@instances.push(node)
    end

    #Methods for Creating a Square
    def my_select(num)
        array=@@instances.select{|node| node.position[0] == num}
    end

    def create_position(num)
        array=my_select(num)
        if array.nil? || array.empty?
            position=[num,1]
        else
            position=[num,(array[-1][1]+1)]
        end
        valid?(position)&& !exist?(position) ? position : create_square
    end

    def the_parents_array(position,owner)
        parents=[]
        RETRACEMENT.each do |r|
            x=r[0] + position[0]
            y=r[1] + position[1]

            parent_node=find_node([x,y])
            parents.push(parent_node) if parent_node.owner == owner && parent_node != nil
        end
        parents
    end

    def find_node(position)
        @@instances.each do |node|
           node if node.position== position
        end
    end

    def exist?(position)
        true if @@instances.any?{|node| node.position == position}
    end


    def valid?(position)
        position[0].between?(1,7) && position[1].between?(1,6)
    end

    #THE TURNS
    def turns
        loop do
            @display.print_display
            players_turn
            choose_text
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