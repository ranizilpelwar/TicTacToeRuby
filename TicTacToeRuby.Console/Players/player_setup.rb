require_relative './player_symbol_setup.rb'
require_relative '../../TicTacToeRuby.Core/Evaluators/player_symbol_evaluator.rb'

class PlayerSetup

  def initialize(args)
    @reader = args[:reader]
    @writer = args[:writer]
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
    MessageGenerator.invalid_selection_error
  end

  def display_invalid_input_message
    @writer.display_message(error_message)
  end

  def user_selection
    input = @reader.read_and_validate(PlayerSymbolValidator.validate_by, input_choices, @writer, error_message)
    input = input.upcase
  end

  def display_and_configure!(match_type)
    display_prompt
    display_options
    player_manager = setup_players(match_type)
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

  def get_player_symbols
    prompt_for_player_symbol(1)
    #symbol_one = PlayerSymbolSetup.get_symbol_for_player(@writer, @reader)
    symbol_one = user_selection
    prompt_for_player_symbol(2)
    symbol_two = get_unique_symbol_for_player2(symbol_one)
    symbols = [symbol_one, symbol_two]
  end

  def get_unique_symbol_for_player2(symbol_one)
    same_value = true
    while same_value
      symbol_two = user_selection
      same_value = PlayerSymbolEvaluator.equal?(symbol_one, symbol_two)
      @writer.display_message(MessageGenerator.uniqueness_error) unless !same_value
    end
    result = symbol_two
  end

  def prompt_for_player_symbol(player_number)
    @writer.display_message(MessageGenerator.player_symbol_prompt(player_number))
  end
end
