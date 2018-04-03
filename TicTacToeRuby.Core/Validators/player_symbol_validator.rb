module PlayerSymbolValidator
  def self.valid?(input)
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "input", "nil") if input.nil?
    raise ArgumentError, MessageGenerator.argument_error("determine if valid", "input", "empty") if input == ""
    pattern = /\A[^0-9\s]{1}\z/
    match_data = pattern.match(input)
    match_data != nil
  end
end
