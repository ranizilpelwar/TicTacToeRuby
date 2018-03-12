class PlayerSymbolValidator
  def self.valid?(input)
    pattern = /\A[^0-9]{1}\z/
    match_data = pattern.match(input)
    valid = match_data !=nil ? true : false
  end
end
