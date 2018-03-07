require_relative '../Exceptions/PlayerTypeError.rb'

class PlayerType
  attr_reader :options

  def options
    @options = [ :Human, :Computer ]
  end
  
  def initialize(type)
    if type != :Human and type != :Computer
      raise PlayerTypeError.new("PlayerType has only two valid choices: Human, Computer.") 
    end
  end

end
