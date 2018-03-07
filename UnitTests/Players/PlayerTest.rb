require 'test/unit'
require_relative '../../Players/Player.rb'

class TC_PlayerTest < Test::Unit::TestCase
  
  def test_player_initialization_sets_type_to_the_given_value

    @player = Player.new("Human", "X")

    assert_equal(@player.type, 'Human')
  end

  def test_player_initialization_sets_symbol_to_the_given_value

    @player = Player.new(:Human, "X")

    assert_equal(@player.symbol, 'X')
  end


end