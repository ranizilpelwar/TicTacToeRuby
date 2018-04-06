require_relative '../../TicTacToeRuby.Console/Output/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module PlayerSymbolValidator
  def self.valid?(input)
    raise NilReferenceError if input.nil?
    raise InvalidValueError if input == ""
    pattern = /\A[^0-9\s]{1}\z/
    match_data = pattern.match(input)
    match_data != nil
  end
end
