require 'colorize'

module Text

    def greetings
        puts 'Welcome to this awesome console game of connect four!'
    end

    def choose_your_name_text(num)
        puts "How should I call you Player #{num}? "
    end

    def players_turn
        puts "It is #{@current_player.name}'s turn."
    end

    def choose_text
        puts "Choose a number between 1 & 7."
    end
    
    def victory(player)
        puts "#{player.name} has won!"
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