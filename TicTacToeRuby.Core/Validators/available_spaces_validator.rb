class AvailableSpacesValidator

  def self.get_available_spaces(board)
    raise ArgumentError, "Cannot get available spaces when provided board is nil." unless board.nil? == false
    available_spaces = []
    board.each do |tile_on_board| 
      available_spaces.push(tile_on_board) unless AvailableSpacesValidator.digit?(tile_on_board) == false
    end
    return available_spaces
  end

  # A negative number is not a valid digit in this game.
  def self.digit?(input)
    pattern = /\A[0-9]+\z/
    match_data = pattern.match(input)
    valid = match_data !=nil ? true : false
  end
end