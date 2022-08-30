class Display
    attr_accessor :array


    def initialize
        @array = create_array
    end

    def create_array
        array=[]
        x=1
        y=1
        loop do
            array.push(x,y)
            y+=1 if x == 7
            x == 7 ? x == 1: x+=1
            break if array[-1]==[7,6]
        end
        array
    end

end
