require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module PlayerSymbolValidator

  SYMBOL_PATTERN = /\A[^0-9\s]{1}\z/

  def self.valid?(input)
    validate_by.(input, SYMBOL_PATTERN)
  end

  def self.validate_by
    return lambda do |input, valid_choices_regex_pattern|
      raise NilReferenceError if input.nil?
      raise InvalidValueError if input == ""
      match_data = valid_choices_regex_pattern.match(input)
      match_data != nil
    end
  end
end
