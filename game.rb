require_relative 'squares.rb'
require_relative 'Text_module.rb'
require_relative 'players.rb'
require"pry-byebug"
require "colorize"




class Game

    RETRACEMENT=[[0,-1],[-1,-1],[-1,0],[1,0],[1,1],[1,-1],[-1,1]]


    include Text
    attr_accessor :current_player,:player1,:player2,:display

    @@instances=[]
    @@taken_positions=[]

    def initialize
        @player1=nil
        @player2=nil
        @display= Display.new
        @current_player = nil
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


    #THE TURNS
    def turns
        loop do
            players_turn
            choose_text
            num=@current_player.players_selection
            create_square(@current_player,num)
            @display.update_display(num.to_s,@current_player)
            @display.print_display
       # break if @current_node.victory?(@current_node,@current_player)
       binding.pry
            swap_current_player
        end
        victory(@current_player)
    end



     #turn control
    def swap_current_player
      @current_player == @player1 ? @current_player=@player2 : @current_player = @player1
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
        @@taken_positions.push(position)
    end

    #Methods for Creating a Square
    def my_select(num)
        array=@@taken_positions.select{|node| node[0] == num}
    end

    def create_position(num)
        array=my_select(num)
        binding.pry
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
           
            result = [x,y]
            parent_node=find_node(result) if valid?(result)
            binding.pry
            parents.push(parent_node) if checking_parent_node(parent_node)
        end
        parents
    end

    def checking_parent_node(parent_node)
        binding.pry
        @current_player
        return false if parent_node.nil?
        return false if exist?(parent_node) == false
        return false if valid?(parent_node.position) == false
        return false if !parent_node.is_a?(Square)
        return false if @current_player !=parent_node.owner
        return true
    end

    def find_node(position)
        result=''
        @@instances.each do |node|
          result=node if node.position== position
        end
        return if result == ''
        result
    end

    def exist?(position)
        true if @@instances.any?{|node| node.position == position}
    end


    def valid?(position)
        position[0].between?(1,7) && position[1].between?(1,6)
    end




end