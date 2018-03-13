require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../Output/console_writer.rb'

class MatchTypeSetup

  # Retrieves the type of match the user wants to play. First match corresponds to a value of 1. 
  # Validates that the selection is within range of available matches.
  def self.get_valid_match_type(writer, reader, match_type_manager)
    input = ""
    is_valid = false

  end

  def self.prompt_for_match_type_selection(writer, match_type_manager)
    writer.display_message("Who is playing? Please select one of the matches below:\n")
    type = 1
    match_type_manager.matches.each { |match|  
      player1_type_selection = match.player1_type.selected_option
      player2_type_selection = match.player2_type.selected_option
      writer.display_message("#{type}. #{player1_type_selection} Vs #{player2_type_selection}")  
      type = type + 1
    }

  end
end

