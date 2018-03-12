class PlayerSymbolValidator
  def self.valid?(input)
    is_integer = input.to_i.is_a? Integer
    is_character_length = input.length == 1
    valid = !is_integer && is_character_length ? true : false
  end
end
