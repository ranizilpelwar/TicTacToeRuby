require_relative 'available_spaces_validator.rb'
require_relative 'game_over_validator.rb'

module TieGameValidator
  def self.tie_game?(board)
    raise ArgumentError, MessageGenerator.argument_error("determine if tie_game", "board", "nil") if board.nil?
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    result = available_spaces.length == 0 && !GameOverValidator.game_over?(board)
  end
end