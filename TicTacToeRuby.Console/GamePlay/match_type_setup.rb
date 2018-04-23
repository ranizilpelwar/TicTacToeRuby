require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'

class MatchTypeSetup

def initialize(args)
    @reader = args[:reader]
    @writer = args[:writer]
    @match_type_manager = args[:match_type_manager]
  end

  def display_screen_title
    @writer.display_message(MessageGenerator.title_of_match_setup_screen)
  end

  def display_prompt
    @writer.display_message(MessageGenerator.match_selection_prompt)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def display_options
    type = 1
    @match_type_manager.matches.each { |match|  
      player1_type_selection = match.player1_type.selected_option
      player2_type_selection = match.player2_type.selected_option
      @writer.display_text(MessageGenerator.option_number(type))
      @writer.display_message(MessageGenerator.match_option_description(player1_type_selection, player2_type_selection))
      type = type + 1
    }
  end

  def input_choices
    choices = @match_type_manager.get_match_numbers
  end

  def valid_selection?(selected_input)
    # match against regex pattern
    # validation should be in business logic layer - use this method as a wrapper
    @match_type_manager.valid?(selected_input)
  end

  def display_invalid_input_message
    @writer.display_message(MessageGenerator.invalid_selection_error_for("match type"))
  end




  # # TODO: Remove method - no longer used
  # Retrieves the type of match the user wants to play. First match corresponds to a value of 1. 
  # Validates that the selection is within range of available matches.
  def self.get_valid_match_type(writer, reader, match_type_manager)
    input = ""
    valid = false
    total_matches = match_type_manager.get_total_available_matches
    while !valid
      input = reader.read_input_ignore_empty
      numeric_input = input.to_i
      valid = match_type_manager.valid?(numeric_input)
      writer.display_message(MessageGenerator.invalid_selection_error) unless valid
    end 
    match_type = match_type_manager.get_match_type(numeric_input)
  end

  # Being deprecated by new design
  def self.prompt_for_match_type_selection(writer, match_type_manager)
    writer.display_message(MessageGenerator.match_selection_prompt)
    writer.display_message(MessageGenerator.line_spacer)
    type = 1
    match_type_manager.matches.each { |match|  
      player1_type_selection = match.player1_type.selected_option
      player2_type_selection = match.player2_type.selected_option
      writer.display_text(MessageGenerator.option_number(type))
      writer.display_message(MessageGenerator.match_option_description(player1_type_selection, player2_type_selection))
      type = type + 1
    }
  end



end

