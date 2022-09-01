require_relative 'players.rb'
require_relative 'Text_module.rb'

class Board
    include Text_module.rb

    attr_accessor :square_number

    @@instances=[]

    RETRACEMENT=[[0,-1],[-1,-1],[-1,0],[1,0],[1,1]]

    def initialize(owner,position,parents=[])
        @position= position
        @owner= owner
        @parents=parents
        #retrace the parents with the same owner, if any.
        #owner by the concept of current player.
    end


    def my_select(num)
        array=@@instances.select{|node| node.position[0] == num}
        position = [num,array[-1][1]+1]
        position if valid?(position) && !exist?(position)
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

    def create_square(position,current_player)

    end

    def check_owners_vertical(square,owner)
    end

    def check_owners_horizontal(square,owner)
    end

    def check_owners_diagonal_left_to_right(square,owner)
    end

    def check_owners_diagonal_right_to_left(square,owner)
    end

    def find_node(position)
        @@instances.each do |node|
           node if node.position== position
        end
    end

    def valid?(position)
        position[0].between?(1,7) && position[1].between?(1,6)
    end

    def exist?(position)
        true if @@instances.any?{|node| node.position == position}
    end

    def victory?(node)
    end

end