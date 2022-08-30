class Players
    attr_reader :name,:number
    attr_accessor :places_taken

    def initialize(name,number)
        @name=name
        @number=number
        @places_taken=[]
    end

    def players_selection
        number=gets.chomp
        number
    end


    def updating_places_taken()
    end
