require_relative '../Exceptions/invalid_value_error.rb'

class PlayerType
  
  OPTIONS = [:Human, :Computer]

  attr_reader :selected_option

  def self.valid?(type)
    OPTIONS.include?(type)
  end

  def initialize(type)
    raise InvalidValueError, "type = #{type}" if !PlayerType.valid?(type)
    @selected_option = type
  end
end


