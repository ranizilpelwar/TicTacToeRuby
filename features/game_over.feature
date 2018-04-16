Feature: A game is over when someone wins or its a tie
	As a game admin
	I want to be able to identify a win or a tie
	So that the user knows when the game has ended and if anyone has won

	Scenario: Game ends in a tie
		When all spaces are occupied with no tic tac toe configuration on the board
		Then the game has ended in a tie

	Scenario: Game ends in a win for a player that has 3 squares in a row
		When there are three squares in a single row on the board, all occupied by player symbol "X" 
		Then the player with a symbol "X" has won the game
		And the game is over

	Scenario: Game ends in a win for a player that has 3 squares in a column
		When there are three squares in a single column on the board, all occupied by player symbol "X"
		Then the player with a symbol "X" has won the game
		And the game is over

	Scenario: Game ends in a win for a player that has 3 squares in a left-to-right diagonal
		When there are three squares in a left-to-right diagonal on the board, all occupied by a player symbol "X"
		Then the player with a symbol "X" has won the game
		And the game is over

  Scenario: Game ends in a win for a player that has 3 squares in a right-to-left diagonal
		When there are three squares in a right-to-left	diagonal on the board, all occupied by a player symbol "X"
		Then the player with a symbol "X" has won the game
	  And the game is over
