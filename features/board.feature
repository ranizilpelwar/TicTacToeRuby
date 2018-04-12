Feature: Provide a board on which to play
As a game admin
I want to be able to display the board on which the players play the game
To provide a visual indicator of the game play and status

	Scenario: A game is played on a square containing 9 spaces
  When the board is displayed
	Then the board should have 9 total squares

	Scenario: A numeric indicator is displayed on each square of the board

	Scenario: The numbers 1-9 are displayed on the board by default

	Scenario: A unoccupied square on the board can be updated with a player symbol

  Scenario: An occupied square on the board cannot be updated with a player symbol

	Scenario: An occupied square on the board can be unselected by a player

		


