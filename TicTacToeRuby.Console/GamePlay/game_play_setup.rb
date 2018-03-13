require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'
require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Players/player_symbol_setup.rb'
require_relative '../Players/first_player_setup.rb'
require_relative 'match_type_setup.rb'

class GamePlaySetup
  attr_reader :player_manager, :writer, :reader

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
    setup
  end

  def setup
    display_introductory_message
    match_type = setup_match
    setup_players(match_type)
  end

  def display_introductory_message
    writer.display_message("Welcome to Tic Tac Toe!")
    writer.display_message("Let's play a game!\n")
  end

  def setup_match
    match_type_manager = MatchTypeManager.new
    match_type = MatchTypeSetup.get_valid_match_type(@writer, @reader, match_type_manager)
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
   
    @player_manager = PlayerManager.new(player1, player2)

    # update current player based on who is selected as first player
    symbol_of_first_player = FirstPlayerSetup.prompt_for_first_player_symbol(@writer, @reader, symbol_one, symbol_two)
    current_player_symbol = @player_manager.current_player.symbol
    @player_manager.update_current_player unless symbol_of_first_player == current_player_symbol 
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
