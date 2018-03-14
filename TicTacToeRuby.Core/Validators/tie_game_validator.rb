require_relative 'available_spaces_validator.rb'

class TieGameValidator
  def self.tie_game?(board)
    raise ArgumentError, "Cannot determine if game is tied because provided board is nil." unless !board.nil?
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    result = available_spaces.length == 0 ? true : false
  end
end