require_relative 'available_spaces_validator.rb'
require_relative 'game_over_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

module TieGameValidator
  def self.tie_game?(board)
    raise NilReferenceError, "board" if board.nil?
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    result = available_spaces.length == 0 && !GameOverValidator.game_over?(board)
  end
end