require_relative 'TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative 'TicTacToeRuby.Console/Output/console_writer.rb'
require_relative 'TicTacToeRuby.Console/Input/console_reader.rb'

# Main file that starts the game. 

console_writer = ConsoleWriter.new
console_reader = ConsoleReader.new
game = GamePlaySetup.new(console_writer, console_reader, "../../tictactoeruby.core/config/")
game.setup
game.play