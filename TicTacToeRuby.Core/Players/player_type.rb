require_relative '../Exceptions/invalid_value_error.rb'

class PlayerType
  
  OPTIONS = [:Human, :Computer]

  attr_reader :selected_option

  def self.valid?(type)
    OPTIONS.include?(type)
  end

  def initialize(type)
    @selected_option = if PlayerType.valid?(type)
                          type
                        else
                          raise InvalidValueError.new  
                        end
  end
end


