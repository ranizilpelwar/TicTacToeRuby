require_relative 'match_type.rb'
require_relative '../Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class MatchTypeManager
  attr_reader :matches

  def initialize
    # define player types
    player_type_human = PlayerType.new(:Human)
    player_type_computer = PlayerType.new(:Computer)

    # define match types
    match1_human_vs_human = MatchType.new(player_type_human, player_type_human)
    match2_human_vs_computer = MatchType.new(player_type_human, player_type_computer)
    match3_computer_vs_computer = MatchType.new(player_type_computer, player_type_computer)

    # add match types to manager
    @matches = []
    @matches << match1_human_vs_human
    @matches << match2_human_vs_computer
    @matches << match3_computer_vs_computer
  end

  def get_total_available_matches
    total = @matches.length
  end

  # match_number: The number of the match, where 1 represents the first match displayed in the game (Human vs Human).
  def get_match_type(match_number)
    raise InvalidValueError, "match_number" if !valid?(match_number)
    index = match_number - 1
    match_type = @matches[index]
  end

  def valid?(match_number)
    max_match_number = get_total_available_matches
    valid = match_number >= 1 && match_number <= max_match_number
  end

  def get_match_numbers
    array = []
    number = 1
    total = get_total_available_matches
    total.times do 
      array << number
      number = number + 1
    end
    result = array
  end

  def input_choices
    choices = get_match_numbers.map(&:to_s)
  end
end
