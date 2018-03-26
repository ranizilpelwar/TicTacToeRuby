require_relative '../TicTacToeRuby.Core/Players/player.rb'
require_relative '../TicTacToeRuby.Core/Players/player_type.rb'

RSpec.describe "a player" do

	it "has a symbol" do
		raise if player("Human", "X").symbol != "X" 
	end

  describe "symbol" do
    it "can have alpha characters" do
      raise if !symbol_valid?("a")
    end
    it "is one character long" do
      raise if symbol_valid?("ab")
    end
    it "does not have numbers in it" do
      raise if symbol_valid?("1")
    end
  end

	it "has a type" do
		raise if player("Human", "X").type != "Human"
	end

	describe "type" do
	  it "can be a computer" do
	    raise if player_type_option(:Computer) != :Computer 
	  end
	  it "can be a human" do
	    raise if player_type_option(:Human) != :Human 
	  end
  end



# Automation Logic
  
  def player(type, symbol)
    Player.new(type, symbol)
  end

  def symbol_valid?(symbol)
    PlayerSymbolValidator.valid?(symbol)
  end

  def player_type_option(type)
    PlayerType.new(type).selected_option
  end
end




