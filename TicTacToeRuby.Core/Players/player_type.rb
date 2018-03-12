require_relative '../Exceptions/player_type_error.rb'

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
                          raise PlayerTypeError.new("Invalid type was chosen during PlayerType initialization.")  
                        end
  end
end


