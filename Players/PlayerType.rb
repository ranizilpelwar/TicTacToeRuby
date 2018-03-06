require_relative '../Exceptions/PlayerTypeError.rb'

class PlayerType
  options = [ :Human, :Computer ]
  def initialize(type)
    if type != :Human and type != :Computer
      raise PlayerTypeError.new("PlayerType has only two valid choices: Human, Computer.") 
    end
  end
end
