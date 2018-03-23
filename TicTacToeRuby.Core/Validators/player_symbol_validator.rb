module PlayerSymbolValidator
  def self.valid?(input)
    pattern = /\A[^0-9\s]{1}\z/
    match_data = pattern.match(input)
    match_data != nil
  end
end
