require_relative '../TicTacToeRuby.Core/Players/player.rb'
require_relative '../TicTacToeRuby.Core/Players/player_type.rb'

RSpec.describe "a player" do
  
  def player(type, symbol)
  	Player.new(type, symbol)
  end

	it "has a symbol" do
		raise unless player("Human", "X").symbol == "X" 
	end
	it "has a type" do
		raise unless player("Human", "X").type == "Human"
	end

	describe "type" do
	  it "can be a computer" do
	    raise unless PlayerType.new(:Computer).selected_option == :Computer 
	  end
	  it "can be a human" do
	    raise unless PlayerType.new(:Human).selected_option == :Human 
	  end
  end
end




