require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'
require_relative '../../TicTacToeRuby.Console/Players/player_setup.rb'

Given("a new game is started") do
  @players = []
end

Given("player {int} is set up with symbol {string}") do |int, string|
  player = Player.new(PlayerType.new(:Human), string)
  @players << player
end

Then("player setup displays an error") do
  expect {PlayerManager.new(@players[0], @players[1])}.to raise_error(InvalidValueError)
end

Then("player setup is successful") do
  player_manager = PlayerManager.new(@players[0], @players[1])
  expect(!player_manager.nil?).to be true
end

When("the user selects player with symbol {string} to go first") do |string|
  @selection_for_first_player = string
end

Then("that player can go first in the game") do
	expect(PlayerSelectionValidator.valid?(@selection_for_first_player, @players[0].symbol, @players[1].symbol)).to be true
end

Then("that player cannot go first in the game") do
	expect(PlayerSelectionValidator.valid?(@selection_for_first_player, @players[0].symbol, @players[1].symbol)).to be false
end

Given("a PlayerSetup is initialized") do
  @reader = MockConsoleReader.new("x")
  args = {:reader => @reader, :writer => ConsoleWriter.new }
  @player_setup = PlayerSetup.new(args)
end

When("input_choices is called") do
  @input_choices_actual = @player_setup.input_choices
end

Then("the returned value is an expected regular pattern") do
  expect(@input_choices_actual).to eq(/\A[^0-9\s]{1}\z/)
end

When("a user types in a {string}") do |symbol|
  allow(@reader).to receive(:read_and_validate).and_return("x")
end

Then("user_selection returns a {string}") do |symbol|
  expect(@player_setup.user_selection).to eq(symbol)
end

Given("player one's symbol is {string}") do |symbol|
  @symbol_one = symbol
end

When("a user types in a {string} first and then a {string}") do |symbol1, symbol2|
  allow(@player_setup).to receive(:user_selection).and_return("X", "Y")
end

Then("get_unique_symbol_for_player2 returns a {string}") do |symbol|
  expect(@player_setup.get_unique_symbol_for_player2(@symbol_one)).to eq(symbol)
end

