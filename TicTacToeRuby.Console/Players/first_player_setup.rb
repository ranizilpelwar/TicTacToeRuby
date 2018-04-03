require_relative '../Input/console_reader.rb'
require_relative '../Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Core/Validators/player_selection_validator.rb'

class FirstPlayerSetup
  def self.prompt_for_first_player_symbol(writer, reader, player_symbol_one, player_symbol_two)
    prompt_for_input(writer, player_symbol_one, player_symbol_two)
    input = ""
    valid_input = false
    begin
      input = reader.read_input_ignore_empty
      valid_input = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
      display_message_and_prompt(writer, player_symbol_one, player_symbol_two) unless valid_input
    end while !valid_input
    input = input.upcase
  end

  def self.prompt_for_input(writer, player_symbol_one, player_symbol_two)
    writer.display_message(MessageGenerator.first_player_of_game_prompt(player_symbol_one, player_symbol_two))
  end

  def self.display_invalid_input_message(writer)
    writer.display_message(MessageGenerator.invalid_selection_error)
  end

  def self.display_message_and_prompt(writer, player_symbol_one, player_symbol_two)
    display_invalid_input_message(writer)
    prompt_for_input(writer, player_symbol_one, player_symbol_two)
  end
end
