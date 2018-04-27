require_relative './yaml_reader.rb'
require_relative './language_options_adapter.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module MessageGenerator

  attr_reader :language_config

  def self.directory
    directory = "../config/"
  end

  def self.get_language_config
    @language_config = LanguageOptionsAdapter.new(directory) if @language_config.nil? || @language_config.stored_default_tag != @language_config.default_language_tag
    result = @language_config
  end

  def self.generate_file_path(file_name, language_tag)
    raise NilReferenceError, "file_name" if file_name.nil?
    raise InvalidValueError, "file_name" if file_name == ""
    file_path = directory + file_name + "." + language_tag + ".yaml"
  end

  def self.get_data(file_name, property)
    data = YAMLReader.read_data(generate_file_path(file_name, get_language_config.default_language_tag), property)
  end

  def self.welcome
    message = get_data("application_text", "welcome")
  end

  def self.language_configuration_prompt
    message = get_data("application_text", "language_configuration_prompt")
  end

  def self.language_configuration_option
    message = get_data("application_text", "language_configuration_option")
  end

  def self.language_selection_prompt
    message = get_data("application_text", "language_selection_prompt")
  end

  def self.language_options
    options = get_language_config.all_languages
    input_choices = get_language_config.input_choices
    count = input_choices.size
    all_options = []
    iterator = 1
    count.times do
      message = ""
      message = message + iterator.to_s + ". " + options[iterator-1]['description'] + "\n"
      all_options << message
      iterator = iterator + 1
    end
    all_options
  end

  def self.player_setup_prompt
    message = get_data("application_text", "player_setup_prompt")
  end

  def self.player_symbol_prompt(player_number)
    message = get_data("application_text", "player_symbol_prompt")
    message = message.gsub("[1]", player_number.to_s)
  end

  def self.player_symbol_option
    message = get_data("application_text", "player_symbol_option")
  end

  def self.undo_last_move_option
    message = get_data("application_text", "undo_last_move_option")
  end

  def self.game_over
    message = get_data("application_text", "game_over")
  end

  def self.exit_game
    message = get_data("application_text", "exit_game")
  end

  def self.tie_game
    message = get_data("application_text", "tie_game")
  end

  def self.continue_prompt
    message = get_data("application_text", "continue_prompt")
  end

  def self.player_won(winning_symbol)
    message = get_data("application_text", "player_won")
    message = message.gsub("[1]", winning_symbol) if parameter_provided?(winning_symbol)
  end

  def self.players_intro(player1_symbol, player1_type, player2_symbol, player2_type)
    message = get_data("application_text", "players_intro")
    message = message.gsub("[1]", player1_symbol.to_s) if parameter_provided?(player1_symbol)
    message = message.gsub("[2]", player1_type.to_s) if parameter_provided?(player1_type)
    message = message.gsub("[3]", player2_symbol.to_s) if parameter_provided?(player2_symbol)
    message = message.gsub("[4]", player2_type.to_s) if parameter_provided?(player2_type)
  end

  def self.board_intro
    message = get_data("application_text", "board_intro")
  end

  def self.undo_completion_for_one_player
    message = get_data("application_text", "undo_completion_for_one_player")
  end

  def self.undo_completion_for_both_players
    message = get_data("application_text", "undo_completion_for_both_players")
  end

  def self.thinking_process_for_computers_turn(player_symbol)
    message = get_data("application_text", "thinking_process_for_computers_turn")
    message = message.gsub("[1]", player_symbol.to_s) if parameter_provided?(player_symbol)
  end

  def self.thinking_process_incrementor
    message = get_data("application_text", "thinking_process_incrementor")
  end

  def self.next_move_prompt(player_symbol)
    message = get_data("application_text", "next_move_prompt")
    message = message.gsub("[1]", player_symbol.to_s) if parameter_provided?(player_symbol)
  end

  def self.board_square_selection(player_symbol, board_square)
    message = get_data("application_text", "board_square_selection")
    message = message.gsub("[1]", player_symbol.to_s) if parameter_provided?(player_symbol)
    message = message.gsub("[2]", board_square.to_s) if parameter_provided?(board_square)
  end

  def self.match_selection_prompt
    message = get_data("application_text", "match_selection_prompt")
  end

  def self.match_option_description(player1_type, player2_type)
    message = get_data("application_text", "match_option_description")
    message = message.gsub("[1]", player1_type.to_s) if parameter_provided?(player1_type)
    message = message.gsub("[2]", player2_type.to_s) if parameter_provided?(player2_type)
  end

  def self.first_player_of_game_prompt(player_symbol_one, player_symbol_two)
    message = get_data("application_text", "first_player_of_game_prompt")
    message = message.gsub("[1]", player_symbol_one.to_s) if parameter_provided?(player_symbol_one)
    message = message.gsub("[2]", player_symbol_two.to_s) if parameter_provided?(player_symbol_two)
  end

  def self.option_number(number)
    message = get_data("application_text", "option_number")
    message = message.gsub("[1]", number.to_s) if parameter_provided?(number)
  end

  def self.title_of_player_setup_screen
    message = get_data("application_text", "title_of_player_setup_screen")
  end

  def self.title_of_match_setup_screen
    message = get_data("application_text", "title_of_match_setup_screen")
  end

  def self.title_of_language_options_screen
    message = get_data("application_text", "title_of_language_options_screen")
  end
  
  def self.argument_error(method_name, argument_name, reason)
    message = get_data("application_text", "argument_error")
    message = message.gsub("[1]", method_name)
    message = message.gsub("[2]", argument_name)
    message = message.gsub("[3]", reason)
  end

  def self.uniqueness_error
    message = get_data("application_text", "uniqueness_error")
  end

  def self.invalid_selection_error
    message = get_data("application_text", "invalid_selection_error")
  end

  def self.invalid_selection_error_for(property)
    message = get_data("application_text", "invalid_selection_error_for")
    message = message.gsub("[1]", property)
  end

  def self.line_spacer
    message = get_data("application_text", "line_spacer")
  end

  def self.language_defaults_error
    message = get_data("application_text", "language_defaults_error")
  end

  def self.parameter_provided?(parameter)
    result = parameter != "" || !(parameter.nil?)
  end
end