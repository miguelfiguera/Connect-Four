class Players
    attr_reader :name,:number
    attr_accessor :places_taken

    def initialize(name,number)
        @name=name
        @number=number
        @places_taken=[]
    end