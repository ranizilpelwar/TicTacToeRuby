require_relative '../TicTacToeRuby.Core/Players/player.rb'
require_relative '../TicTacToeRuby.Core/Players/player_type.rb'

RSpec.describe "a player" do

	it "has a symbol" do
		raise if player("Human", "X").symbol != "X" 
	end

  describe "symbol" do
    it "is one character long" do
      raise if symbol_valid?("ab")
    end
    
    it "can be an alpha character" do
      raise if !symbol_valid?("a")
    end

    it "can be a keyboard symbol" do
      raise if !symbol_valid?("$")
    end

    it "cannot be a number" do
      raise if symbol_valid?("1")
    end

    it "cannot be a space character" do
      raise if symbol_valid?(" ")
    end

    it "cannot be an empty character" do
      raise if symbol_valid?("")
    end
  end

	it "has a type" do
		raise if player("Human", "X").type != "Human"
	end

	describe "type" do
	  it "can be a computer" do
	    raise if player_type(:Computer).selected_option != :Computer 
	  end

	  it "can be a human" do
	    raise if player_type(:Human).selected_option != :Human 
	  end

    it "cannot be a robot" do
      raise if PlayerType.valid?(:Robot)
    end
  end



# Automation Logic
  
  def player(type, symbol)
    Player.new(type, symbol)
  end

  def symbol_valid?(symbol)
    PlayerSymbolValidator.valid?(symbol)
  end

  def player_type(type)
    PlayerType.new(type)
  end
end




