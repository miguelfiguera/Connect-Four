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
        @color=owner.number
        @parents=parents
        #retrace the parents with the same number, if any.
        #owner by the concept of current player.
    end

    def create_square
    end

    def check_onwners_dfs(square,owner)
    end

    def find_node(position)
        @@instances.each do |node|
            node if node.position== position
        end
    end

    def valid?(position)
        position[0].between?(1,7) && position[1].between?(1,6)
    end

    def victory?(node)
    end

end