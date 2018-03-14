require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'

puts "Test scripts:"

# int = 10.is_a? Integer
# puts int #true

# int = "10".to_i
# puts int.class

# valid = "10".to_i.is_a? Integer
# puts valid

# length = "8".length
# puts length

# def is_integer? (n)
#   pattern = /\A\d+\z/
#   match_data = pattern.match(n)
#   is_int = match_data != nil ? true : false
# end

# input = "-10"
# is_integer = is_integer?(input)
# puts "is_integer:"
# puts is_integer

# is_character_length = input.length == 1
# puts "is_character_length: "
# puts is_character_length

# condition = !is_integer && is_character_length
# puts "condition:"
# puts condition

# valid = !is_integer && is_character_length ? true : false
# puts "validity:"
# puts valid

# def valid?(input)
#   pattern = /\A[^0-9\s]{1}\z/
#   match_data = pattern.match(input)
#   valid = match_data !=nil ? true : false
# end

# input = "1"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = "A"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = "%"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = "#"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = ""
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = "10"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = "AA"
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# input = " "
# result = valid?(input)
# puts "For input of " + input + ":"
# puts result

# expected_player1_type = :Human
# match_type_manager = MatchTypeManager.new
# actual_match_type = match_type_manager.get_match_type(1)
# puts actual_match_type.class
# actual_player1_type = actual_match_type.player1_type

board = []
board << "X"
board << "X"
board << "X"
board << "X"
board << "X"
board << "X"
board << "X"
board << "X"
board << "9"
iterator = 1
available_spaces = []
board.each do |tile_on_board| 
  puts tile_on_board
  available_spaces.push(tile_on_board) unless AvailableSpacesValidator.digit?(tile_on_board) == false
end

puts "Available Spaces:"
puts available_spaces

puts "End available spaces."

board.each { |tile_on_board| 
  puts tile_on_board
  available_spaces.push(tile_on_board) unless AvailableSpacesValidator.digit?(tile_on_board) == false
}



