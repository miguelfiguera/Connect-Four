require_relative 'players.rb'
require_relative 'Text_module.rb'

class Square
    include Text_module.rb
    attr_reader :position, :owner
    attr_accessor :parents

    @@instances=[]

    RETRACEMENT=[[0,-1],[-1,-1],[-1,0],[1,0],[1,1]]

    def initialize(owner,position,parents=[])
        @position= position
        @owner= owner
        @parents=parents
        #retrace the parents with the same owner, if any.
        #owner by the concept of current player.
    end


    #Creating a Square

    def my_select(num)
        array=@@instances.select{|node| node.position[0] == num}
    end

    def creating_position
        num=players_selection
        array=my_select(num)
        if array.nil? || array.empty?
            position=[num,1]
        else
            position = [num,array[-1][1]+1]
        end
        valid?(position) && !exist?(position) ? position : create_square
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

    def create_square(current_player)
        position=creating_position
        parents=the_parents_array(position,current_player)
        node=Square.new(current_player,position,parents)
        @@instances.push(node)
    end

    # Find_node, Valid?, exist?

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



    #Checking for victory

    def single_retrace_calc(node,value)
        position=(node.position[0]+value[0]),(node.position[1]+value[1])
    end

    def check_owners_vertical(node,count=1,value=RETRACEMENT[0])
        parent=find_node(single_retrace_calc(node,value))
        return if parent_node.parents.nil? || parent_node.owner != current_player
        return true if count==4
        count+=1
        check_owners_vertical(parent,count)
    end

    def check_owners_horizontal(square,owner)
    end

    def check_owners_diagonal_left_to_right(square,owner)
    end

    def check_owners_diagonal_right_to_left(square,owner)
    end

    def victory?
        #compound method with all the "#check..."
        #if any return true, then victory...
    end

end