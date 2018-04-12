Feature: Provide a board on which to play
As a game admin
I want to be able to display the board on which the players play the game
To provide a visual indicator of the game play and status

	Scenario: A game is played on a square containing 9 spaces
  When the board is displayed
	Then the board should have 9 total squares

	Scenario: At the start of the game, each square of the board displays a number from 1 thru 9
  When the board is displayed
	Then square 1 displays the number 1
	And square 2 displays the number 2
	And square 3 displays the number 3
	And square 4 displays the number 4
	And square 5 displays the number 5
	And square 6 displays the number 6
	And square 7 displays the number 7
	And square 8 displays the number 8
	And square 9 displays the number 9

	Scenario: A unoccupied square on the board can be updated with a player symbol
	Given the board is displayed
  And square 1 on the board is unoccupied
	When the player selects square 1
	Then square 1 is updated to display the player's symbol

  Scenario: An occupied square on the board cannot be updated with a player symbol
  Given square 1 on the board is occupied by player symbol "X"
	When the player selects square 1
	Then an error message is displayed indicating that the given square cannot be selected


	Scenario: An occupied square on the board can be unselected by a player

		


