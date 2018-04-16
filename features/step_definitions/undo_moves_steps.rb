When("the game is setup") do
	@player_manager = PlayerManager.new(@player1, Player.new(@match_type.player2_type, "Y"))
  @writer = ConsoleWriter.new
	@reader = MockConsoleReader.new("1")
  language = "English"	
	@directory_path_for_default_language = "../TicTacToeRuby/features/test_files/"
	@directory_path_for_default_language = @directory_path_for_default_language + "default_language_" + language.downcase + "/"
	@game_play_setup = GamePlaySetup.new(@writer, @reader, @directory_path_for_default_language)
	@game_board = GameBoard.new(GameBoard.create_board, @player_manager)
	@game_interaction = @game_play_setup.setup_game_interaction(@game_board, @match_type)
end

Then("there is no option to undo moves during game play") do
	expect(@game_interaction.record_last_moves).to eq(false)
end

Then("there is an option to undo moves during game play") do
  expect(@game_interaction.record_last_moves).to eq(true)
end
