require 'colorize'

module Text

    def greetings
        puts 'Welcome to this awesome connect four!'
    end

    def choose_your_name_text
        puts 'How should I call you?'
    end

    def players_turn(player)
        puts "It is #{players.name}'s turn."
    end

    def victory(player)
        puts "#{players.name} has won!"
    end

    def the_rules
       
       puts <<-HEREDOC
        This is connect four.
        The game is pretty simple:
        1)You take turns to choose a column and place a dot,
        2)Dot connection can be vertical, horizontal or diagonal.
        3)The first to connect four dots wins.

        P.D: This is a rigged game, so the chances are that
        the first player wins. Read about this on wikipedia.

        HEREDOC
    end


end