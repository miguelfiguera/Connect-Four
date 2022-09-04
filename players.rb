
class Players
    attr_reader :name,:number
    attr_accessor :places_taken

    def initialize(name,number)
        @name=name
        @number=number
    end


    # Players Choices
def players_selection
    number=gets.chomp
    valid_player_input?(number) ? number.to_i : players_selection
end

def valid_player_input?(string)
    valid_inputs=['1','2','3','4','5','6','7']

    if valid_inputs.include?(string)
        true 
    else
        puts "Not valid input, try again. Only numbers."
        false
    end
end

end
