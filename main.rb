require_relative'game.rb'
require_relative'display.rb'
require_relative'players.rb'
require_relative'squares.rb'
require_relative'Text_module.rb'
require"colorize"
require"pry"


def game
    juego=Game.new
    juego.greetings_and_prep
    juego.turns
    puts 'Want to go again? Y/N'
    answer=gets.chomp
    if answer.downcase == 'y'
        game
    else
        puts "See you later, alligator"
    end
end

game

