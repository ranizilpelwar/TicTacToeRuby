require_relative 'TicTacToeRuby.Console/Output/game_introduction.rb'
require_relative 'TicTacToeRuby.Console/Output/console_writer.rb'
require_relative 'TicTacToeRuby.Console/Input/console_reader.rb'
introduction = GameIntroduction.new
message = introduction.welcome_message()

puts message
board = *('0'..'8').to_a
console_writer = ConsoleWriter.new
formatted_board = console_writer.display_board(board)
console_writer.display_message("Clearing screen...")
sleep(1)
console_writer.clear_screen
console_writer.display_message("Displaying text without new line")
console_writer.display_text(".")
sleep(1)
console_writer.display_text(".")
sleep(1)
console_writer.display_text(".")
sleep(1)
console_writer.display_message("\nEnter input:")
reader = ConsoleReader.new
input = reader.read_input_ignore_empty
console_writer.display_message("Writing input back to screen:")
console_writer.display_message(input)
console_writer.display_message("End")






