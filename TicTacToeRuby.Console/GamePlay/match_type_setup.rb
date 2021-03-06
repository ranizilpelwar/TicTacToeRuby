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
    @match_type_manager.input_choices
  end

  def display_invalid_input_message
    @writer.display_message(MessageGenerator.invalid_selection_error_for("match type"))
  end
end

