Feature: Provide a board on which to play
As a game admin
I want to be able to display the board on which the players play the game
To provide a visual indicator of the game play and status

	Scenario: A game is played on a square containing 9 spaces
  When the board is displayed
	Then the board should have 9 total squares

	Scenario: At the start of the game, each square of the board displays a number from 1 thru 9
  When the board is displayed at the start of the game
	Then square 1 displays the number 1
	And square 2 displays the number 2
	And square 3 displays the number 3
	And square 4 displays the number 4
	And square 5 displays the number 5
	And square 6 displays the number 6
	And square 7 displays the number 7
	And square 8 displays the number 8

	Scenario: A unoccupied square on the board can be updated with a player symbol

  Scenario: An occupied square on the board cannot be updated with a player symbol

	Scenario: An occupied square on the board can be unselected by a player

		


