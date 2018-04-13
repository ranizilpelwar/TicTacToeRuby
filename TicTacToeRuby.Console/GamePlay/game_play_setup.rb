require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_interaction.rb'
require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Players/player_symbol_setup.rb'
require_relative '../Players/first_player_setup.rb'
require_relative 'match_type_setup.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Validators/input_validator.rb'
require_relative '../Languages/language_setup.rb'
require_relative '../Languages/language_options_adapter.rb'
require_relative '../Languages/language_setup.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'


class GamePlaySetup
  attr_reader :writer, :reader, :game_interaction, :match_type_manager, :language_directory, :language_setup

  def initialize(writer, reader, language_directory)
    raise NilReferenceError, "writer" if writer.nil?
    raise NilReferenceError, "reader" if reader.nil?
    @writer = writer
    @reader = reader
    @language_directory = language_directory
    args = {writer: @writer, 
            reader: @reader, 
            language_config: LanguageOptionsAdapter.new(@language_directory)}
    @language_setup = LanguageSetup.new(args)
  end

  def setup
    @writer.clear_screen
    display_introductory_message
    @language_setup.display_language_config_option
    display_match_options
    inquiry = language_configuration_requested?
    request_language_setup = inquiry.feedback
    if request_language_setup
      @writer.clear_screen
      @language_setup.configure_language
      setup
    else
      match_input = inquiry.input
      match_type = @match_type_manager.get_match_type(match_input.to_i)
      player_manager = setup_players(match_type)
      game_board = setup_board(player_manager)
      @game_interaction = setup_game_interaction(game_board, match_type)
    end
  end

  def display_introductory_message
    @writer.display_message(MessageGenerator.welcome)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def display_language_config_option
    @writer.display_message(MessageGenerator.language_configuration)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def language_configuration_requested?
    language_selections = ["L", "l"]
    input_choices = []
    input_choices.push(*language_selections)
    match_numbers = @match_type_manager.get_match_numbers
    match_numbers = match_numbers.map(&:to_s)
    input_choices.push(*match_numbers)
    input = InputValidator.get_valid_selection(@writer, @reader, input_choices)
    feedback = language_selections.include? input
    result = Struct.new(:feedback, :input).new(feedback, input)
  end

  def get_language_selection
    input = InputValidator.get_valid_selection(writer, reader, LanguageSetup.input_choices)
  end

  def display_match_options
    @match_type_manager = MatchTypeManager.new
    MatchTypeSetup.prompt_for_match_type_selection(writer, @match_type_manager)
  end

  def setup_players(match_type)
    symbols = get_player_symbols
    symbol_one = symbols[0]
    symbol_two = symbols[1]
    player1_type = match_type.player1_type
    player2_type = match_type.player2_type
    player1 = Player.new(player1_type, symbol_one)
    player2 = Player.new(player2_type, symbol_two)
   
    player_manager = PlayerManager.new(player1, player2)
   
    symbol_of_first_player = FirstPlayerSetup.prompt_for_first_player_symbol(@writer, @reader, symbol_one, symbol_two)
    current_player_symbol = player_manager.current_player.symbol
    player_manager.update_current_player unless symbol_of_first_player == current_player_symbol 
    result = player_manager
  end

  def setup_board(player_manager)
    game_board = GameBoard.new(player_manager, GameBoard.create_board)
  end

  def setup_game_interaction(game_board, match_type)
    raise NilReferenceError, "game_board" if game_board.nil?
    raise NilReferenceError, "match_type" if match_type.nil?
    record_last_moves = match_type.player1_type.selected_option == :Human || match_type.player2_type.selected_option == :Human
    game_interaction = GameInteraction.new(@writer, @reader, game_board, record_last_moves, match_type)
  end

  def play
    @game_interaction.play_game
  end

  def get_player_symbols
    prompt_for_player_symbol(1)
    symbol_one = PlayerSymbolSetup.get_symbol_for_player(writer, reader)
    prompt_for_player_symbol(2)
    symbol_two = get_unique_symbol_for_player2(symbol_one)
    symbols = [symbol_one, symbol_two]
  end

  def get_unique_symbol_for_player2(symbol_one)
    same_value = true
    while same_value
      symbol_two = PlayerSymbolSetup.get_symbol_for_player(writer, reader)
      same_value = symbol_one.eql? symbol_two
      writer.display_message(MessageGenerator.uniqueness_error) unless !same_value
    end
    result = symbol_two
  end

  def prompt_for_player_symbol(player_number)
    writer.display_message(MessageGenerator.player_symbol_prompt(player_number))
  end
end
