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

class GamePlaySetup
  attr_reader :writer, :reader, :game_interaction, :match_type_manager

  def initialize(writer, reader)
    raise ArgumentError, "Cannot initialize GamePlaySetup because writer is nil." if writer.nil?
    raise ArgumentError, "Cannot initialize GamePlaySetup because reader is nil." if reader.nil?
    @writer = writer
    @reader = reader
    setup
  end

  def setup
    display_home_screen
    evaluate_if_language_should_be_configured
    match_type = setup_match
    player_manager = setup_players(match_type)
    game_board = setup_board(player_manager)
    @game_interaction = setup_game_interaction(game_board, match_type)
  end

  def display_home_screen
    display_introductory_message
    display_language_config_option
    display_match_options
  end

  def display_introductory_message
    @writer.clear_screen
    @writer.display_message(MessageGenerator.welcome)
    @writer.display_message("\n")
  end

  def display_language_config_option
    @writer.display_message(MessageGenerator.language_configuration)
    @writer.display_message("\n")
  end

  def evaluate_if_language_should_be_configured
    selections = ["L", "l"]
    match_numbers = @match_type_manager.get_match_numbers
    selections.push(*match_numbers)
    input = InputValidator.get_valid_selection(@writer, @reader, selections)
    if selections.include? input
       configure_language
    end
  end

  def configure_language
    @writer.clear_screen
    display_language_options
    LanguageSetup.get_language_selection(writer, reader)
    @writer.clear_screen
    display_home_screen
  end

  def display_language_options
    @writer.display_message(MessageGenerator.language_selection)
  end

  def display_match_options
    @match_type_manager = MatchTypeManager.new
    MatchTypeSetup.prompt_for_match_type_selection(writer, @match_type_manager)
  end

  def setup_match
    match_type = MatchTypeSetup.get_valid_match_type(@writer, @reader, @match_type_manager)
  end

  def setup_players(match_type)
    # get symbols for each player
    symbols = get_player_symbols
    symbol_one = symbols[0]
    symbol_two = symbols[1]

    # get types for each player
    player1_type = match_type.player1_type
    player2_type = match_type.player2_type

    # create the players
    player1 = Player.new(player1_type, symbol_one)
    player2 = Player.new(player2_type, symbol_two)
   
    player_manager = PlayerManager.new(player1, player2)

    # update current player based on who is selected as first player
    symbol_of_first_player = FirstPlayerSetup.prompt_for_first_player_symbol(@writer, @reader, symbol_one, symbol_two)
    current_player_symbol = player_manager.current_player.symbol
    player_manager.update_current_player unless symbol_of_first_player == current_player_symbol 
    result = player_manager
  end

  def setup_board(player_manager)
    game_board = GameBoard.new(player_manager, GameBoard.create_board)
  end

  def setup_game_interaction(game_board, match_type)
    raise ArgumentError, "Cannot setup GameInteraction because game_board is nil." if game_board.nil?
    raise ArgumentError, "Cannot setup GameInteraction because match_type is nil." if match_type.nil?
    record_last_moves = match_type.player1_type == :Human || match_type.player2_type == :Human
    game_interaction = GameInteraction.new(@writer, @reader, game_board, record_last_moves, match_type)
  end

  def play
    @game_interaction.play_game
  end

  def get_player_symbols
    # get info for player 1
    current_player = 1
    message = prompt_for_player_symbol(current_player)
    writer.display_message(message)
    symbol_one = PlayerSymbolSetup.get_symbol_for_player(writer, reader)

    # get info for player 2
    symbol_two = ""
    current_player = current_player + 1
    message = prompt_for_player_symbol(current_player)
    writer.display_message(message)

    # validate that both players didn't provide the same symbol
    same_value = true
    while same_value
      symbol_two = PlayerSymbolSetup.get_symbol_for_player(writer, reader)
      same_value = symbol_one.eql? symbol_two
      writer.display_message("Oops! I can't use the same one. Try a different key.") unless !same_value
    end
    symbols = []
    symbols << symbol_one
    symbols << symbol_two
  end

  def prompt_for_player_symbol(player_number)
    message = "Let's setup Player #{player_number}! Press a key that Player #{player_number} can use in the game. It can be a letter or a symbol."
  end
end
