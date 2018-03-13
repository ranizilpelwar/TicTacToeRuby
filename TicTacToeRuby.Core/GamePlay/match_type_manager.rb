require_relative 'match_type.rb'
require_relative '../Players/player_type.rb'

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
    if match_number < 1 || match_number > 3
    raise ArgumentError, "Match number range is 1 - 3." 
    end
    index = match_number - 1
    match_type = @matches[index]
  end
end
