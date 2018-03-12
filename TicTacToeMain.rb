require_relative 'TicTacToeRuby.Console/Output/game_introduction.rb'
require_relative 'TicTacToeRuby.Console/Output/console_writer.rb'
introduction = GameIntroduction.new()
message = introduction.welcome_message()
puts message
board = *('0'..'8').to_a
console_writer = ConsoleWriter.new()
formatted_board = console_writer.display_board(board)
puts "Clearing screen..."
sleep(1)
console_writer.clear_screen
puts "Displaying text without new line"
console_writer.display_text(".")
sleep(1)
console_writer.display_text(".")
sleep(1)
console_writer.display_text(".")
sleep(1)






