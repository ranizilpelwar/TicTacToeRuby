require_relative './player_symbol_setup.rb'

class PlayerSetup

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def display_screen_title
    @writer.display_message(MessageGenerator.title_of_player_setup_screen)
  end

  def display_prompt
    @writer.display_message(MessageGenerator.player_setup_prompt)
  end

  def display_options
    @writer.display_message(MessageGenerator.player_symbol_option)
  end

  def input_choices
    PlayerSymbolValidator::SYMBOL_PATTERN
  end

  def error_message
    PlayerSymbolSetup.error_message
  end

  def display_invalid_input_message
    @writer.display_message(error_message)
  end

  def user_selection
    input = @reader.read_and_validate(PlayerSymbolValidator.valid?, input_choices, @writer, error_message)
  end

  def display_and_configure!
    
  end
end
