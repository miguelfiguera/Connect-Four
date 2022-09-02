require_relative 'players.rb'
require_relative 'Text_module.rb'

class Square
    include Text_module.rb
    attr_reader :position, :owner
    attr_accessor :parents

    @@instances=[]

    RETRACEMENT=[[0,-1],[-1,-1],[-1,0],[1,0],[1,1],[1,-1],[-1,1]]

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
            position = [num,(array[-1][1]+1)]
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

    def check_owners_vertical(node,current_player,count=1)
        value=RETRACEMENT[0]
        parent=find_node(single_retrace_calc(node,value))
        return if parent_node.parents.nil? || parent_node.owner != current_player
        return true if count==4
        count+=1
        check_owners_vertical(parent,count)
    end

    #CHECK HORIZONTAL: Left, Right && Total.

    def check_horizontal_left(square,current_player,array=[])
        left = RETRACEMENT[2]
        parent= find_node(single_retrace_calc(square,left))
        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4
        array.push(parent)
        check_horizontal_left(parent,current_player,array)
    end

    def check_horizontal_right(square,current_player,array=[])
        right = RETRACEMENT[3]
        parent= find_node(single_retrace_calc(square,right))
        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4
        array.push(parent)
        check_horizontal_right(parent,current_player,array)
    end

    def check_horizontal_total(square,current_player)
        a= check_horizontal_left(square,current_player)
        b= check_horizontal_right(square,current_player)
        c= a+b
        if c.uniq.all?{|node| node.owner == current_player} && c.length >=4
            true
        else
            false
        end
    end



    #CHECK DIAGONAL LEFT TO RIGHT

    def check_left_down(square,current_player,array=[])
        left_down=RETRACEMENT[1]
        parent= find_node(single_retrace_calc(square,left_down))

        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4

        array.push(parent)
        check_left_down(parent,current_player,array)

    end

    def check_right_up(square,current_player,array=[])
        right_up=RETRACEMENT[4]
        parent= find_node(single_retrace_calc(square,right_up))

        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4
        
        array.push(parent)
        check_right_up(parent,current_player,array)
    end

    def check_diagonal_left_to_right(square,current_player)
        a= check_left_down(square,current_player)
        b=check_right_up(square,current_player)
        c = a+b
        if c.uniq.all?{|node| node.owner == current_player} && c.length >=4
            true
        else
            false
        end
    end

    #CHECK DIAGONAL RIGHT TO LEFT

    def check_right_down(node,current_player,array=[])
        right_down=RETRACEMENT[5]
        parent= find_node(single_retrace_calc(node,right_down))

        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4

        array.push(parent)
        check_right_down(parent,current_player,array)

    end

    def check_left_up(node,current_player,array=[])
        left_up=RETRACEMENT[6]
        parent= find_node(single_retrace_calc(node,left_up))

        return array if parent.nil? || parent.owner != current_player || array.uniq.length == 4

        array.push(parent)
        check_left_up(parent,current_player,array)

    end

    def check_diagonal_right_to_left(node,current_player)
        a=check_right_down(node,current_player)
        b=check_left_up(node,current_player)
        c=a+b 
        if c.uniq.all?{|node| node.owner == current_player} && c.length >=4
            true
        else
            false
        end
    end

    def victory?(node,current_player)
        if check_horizontal_total(node,current_player)|| check_owners_vertical(node)
            true
        elsif check_diagonal_left_to_right(node,current_player) || check_diagonal_right_to_left(node,current_player)
            true
        else
            false
        end
    end

    def print_instances
        print @@instances
    end
    
end