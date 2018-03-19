class PlayerSelectionValidator
  def self.valid?(input, player_symbol_one, player_symbol_two)
    input_upcase = input.upcase
    valid = input_upcase == player_symbol_one.upcase || input_upcase == player_symbol_two.upcase
  end
end
