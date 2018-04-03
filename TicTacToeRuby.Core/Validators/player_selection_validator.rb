module PlayerSelectionValidator
  def self.valid?(input, player_symbol_one, player_symbol_two)
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "input", "nil") if input.nil?
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "player_symbol_one", "nil") if player_symbol_one.nil?
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "player_symbol_two", "nil") if player_symbol_two.nil?
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "input", "empty") if input == ""
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "player_symbol_one", "empty") if player_symbol_one == ""
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "player_symbol_two", "empty") if player_symbol_two == ""
    input_upcase = input.upcase
    valid = input_upcase == player_symbol_one.upcase || input_upcase == player_symbol_two.upcase
  end
end
