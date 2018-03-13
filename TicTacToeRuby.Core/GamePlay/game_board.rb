require_relative '../Players/player_manager.rb'

class GameBoard
  attr_reader :player_manager, :board

  def initialize(player_manager)
    raise ArgumentError, "Cannot create GameBoard with nil player_manager." unless player_manager != nil
    @board = []
    @board << "1"
    @board << "2"
    @board << "3"
    @board << "4"
    @board << "5"
    @board << "6"
    @board << "7"
    @board << "8"
    @board << "9"
  end
end
