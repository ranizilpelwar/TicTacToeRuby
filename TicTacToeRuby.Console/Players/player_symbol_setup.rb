require_relative '../Input/console_reader.rb'
require_relative '../Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'

class PlayerSymbolSetup
  def self.get_symbol_for_player(writer, reader)
    input = ""
    valid_input = false
    begin
      input = reader.read_input_ignore_empty
      valid_input = PlayerSymbolValidator.valid?(input)
      display_invalid_input_message(writer) if !valid_input
    end while !valid_input
    input = input.upcase
  end

  def self.display_invalid_input_message(writer)
    writer.display_message("Oops! I can't use that. Try a different key.")
  end
end
