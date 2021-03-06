require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'
require_relative '../../TicTacToeRuby.Core/Languages/language_options_adapter.rb'
require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_interaction.rb'
require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Players/player_setup.rb'
require_relative '../Players/first_player_setup.rb'
require_relative 'match_type_setup.rb'
require_relative '../Languages/language_setup.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../Languages/language_options_setup.rb'
require_relative '../GamePlay/match_type_setup.rb'

class GamePlaySetup
  attr_reader :writer, :reader, :game_interaction, :match_type_manager, :language_directory, :language_setup, :language_config

  def initialize(writer, reader, language_directory)
    raise NilReferenceError, "writer" if writer.nil?
    raise NilReferenceError, "reader" if reader.nil?
    @writer = writer
    @reader = reader
    @language_directory = language_directory
    @language_config = LanguageOptionsAdapter.new(@language_directory)
  end

  def setup
    @writer.clear_screen
    display_introductory_message
    display_language_config
    display_match_types
    inquiry = language_configuration_requested?
    request_language_setup = inquiry.feedback
    if request_language_setup
      @writer.clear_screen
      @language_options = LanguageOptionsSetup.new(@reader, @writer, @language_config)
      @language_options.display_and_configure!
      setup
    else
      match_input = inquiry.input
      match_type = @match_type_manager.get_match_type(match_input.to_i)
      player_manager = setup_players(match_type)
      game_board = setup_board
      @game_interaction = setup_game_interaction(game_board, player_manager, match_type)
    end
  end

  def display_language_config
    @language_setup = @language_setup.nil? ? new_language_setup : @language_setup
    @language_setup.display_prompt
    @language_setup.display_options
  end

  def new_language_setup
    args = {writer: @writer, 
            reader: @reader, 
            language_config: @language_config}
    @language_setup = LanguageSetup.new(args)
  end

  def display_introductory_message
    @writer.display_message(MessageGenerator.welcome)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def language_configuration_requested?
    match_numbers = @match_type_setup.input_choices
    @language_setup.language_configuration_requested?(match_numbers)
  end

  def display_match_types
    @match_type_manager = MatchTypeManager.new
    args = {:reader => @reader, :writer => @writer, :match_type_manager => @match_type_manager}
    @match_type_setup = MatchTypeSetup.new(args)
    @match_type_setup.display_prompt
    @match_type_setup.display_options
  end

  def setup_players(match_type)
    args = {:reader => @reader, :writer => @writer}
    player_setup = PlayerSetup.new(args)
    player_setup.display_and_configure!(match_type)
  end

  def setup_board
    game_board = GameBoard.new(GameBoard.create_board)
  end

  def setup_game_interaction(game_board, player_manager, match_type)
    raise NilReferenceError, "game_board" if game_board.nil?
    raise NilReferenceError, "player_manager" if player_manager.nil?
    raise NilReferenceError, "match_type" if match_type.nil?
    record_last_moves = match_type.player1_type.selected_option == :Human || match_type.player2_type.selected_option == :Human
    game_interaction = GameInteraction.new(@writer, @reader, game_board, player_manager, record_last_moves, match_type)
  end

  def play
    @game_interaction.play_game
  end
end
