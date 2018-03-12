require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'

class TestPlayer < Test::Unit::TestCase
  
  def test_player_initialization_sets_type_to_the_given_value
    player = Player.new("Human", "X")
    assert_equal(player.type, 'Human')
  end

  def test_player_initialization_sets_symbol_to_the_given_value
    player = Player.new(:Human, "X")
    assert_equal(player.symbol, 'X')
  end

  def test_equals_returns_true_when_two_players_have_the_same_property_values
    player1 = Player.new(:Human, "X")
    player2 = Player.new(:Human, "X")
    assert(player1.equals?(player2), "The two players should be the same, but they are not.")
  end

  def test_equals_returns_false_when_two_players_have_a_difference_in_one_property_value_for_symbol
    player1 = Player.new(:Human, "X")
    player2 = Player.new(:Human, "Y")
    assert(!player1.equals?(player2), "False is not returned when comparing the players.")
  end

  def test_equals_returns_false_when_two_players_have_a_difference_in_one_property_value_for_type
    player1 = Player.new(:Human, "X")
    player2 = Player.new(:Computer, "X")
    assert(!player1.equals?(player2), "False is not returned when comparing the players.")
  end
end
