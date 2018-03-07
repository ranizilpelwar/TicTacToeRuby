require 'test/unit'
require_relative '../../Players/PlayerType.rb'
require_relative '../../Exceptions/PlayerTypeError.rb'

class TC_PlayerTypeTest < Test::Unit::TestCase
  
  def test_player_type_initialization_returns_true_when_created_as_a_human

    @playerType = PlayerType.new(:Human)

    assert(@playerType, 'Human is selected')
  end

  def test_player_type_initialization_returns_false_when_created_as_a_robot

    assert_raises(PlayerTypeError) { PlayerType.new(:Robot) }

  end


end