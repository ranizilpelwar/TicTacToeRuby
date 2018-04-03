require_relative '../Exceptions/player_type_error.rb'
require_relative '../../TicTacToeRuby.Console/Output/message_generator.rb'

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
                          raise PlayerTypeError.new(MessageGenerator.argument_error("initialize", "type", "invalid"))  
                        end
  end
end


