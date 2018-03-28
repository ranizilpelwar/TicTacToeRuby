module Doubles
 def writer_double
    double("ConsoleWriter", :display_message => "")
  end

  def reader_double(input)
    double("ConsoleReader", :read_input => input, :read_input_ignore_empty => input)
  end

  def match_type_manager_double
    player1_type = double("PlayerType", :selected_option => :Human)
    player2_type = double("PlayerType", :selected_option => :Human)
    match = double("MatchType", :player1_type => player1_type, :player2_type => player2_type)
    player_type = double("PlayerType", )
    match_manager = double("MatchTypeManager", :get_total_available_matches => "1", :matches => [match], :valid? => true, :get_match_type => match)
  end

  def match_type_double(player1_type, player2_type)
    match = double("MatchType", :player1_type => player1_type, :player2_type => player2_type)
  end

  def player_manager_double
    manager = MockPlayerManager.new
  end
end