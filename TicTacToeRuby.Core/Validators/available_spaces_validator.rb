require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

module AvailableSpacesValidator

  # Returns a list of indexes on the board where possible moves can be made.
  def self.get_available_spaces(board)
    raise NilReferenceError, "board" if board.nil?
    available_spaces = []
    board.each do |tile_on_board| 
      if digit?(tile_on_board)
        index = board.index(tile_on_board)
        available_spaces.push(index)
      end
    end
    result = available_spaces
  end

  # Note: A negative number is not a valid digit in this game.
  def self.digit?(input)
    pattern = /\A[0-9]+\z/
    match_data = pattern.match(input)
    valid = match_data !=nil
  end
end