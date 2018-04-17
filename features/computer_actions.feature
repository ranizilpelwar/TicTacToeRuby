Feature: The game calculates the player's next move when the player is a Computer
	As a game admin
	I want to have the computer player be strategic in the game play
	And be unbeatable
	So that the human observer remains engaged
	And the computer player either wins the game or the game results in a tie

	Scenario: The Computer player selects the correct square on the board when there is a winning move that can be made
		Given a game is being played with a computer player
		And selecting square 5 can result in a win for the computer player
		When the computer player makes a move
		Then the computer's next move matches square 5 on the board

	Scenario: The Computer player selects the correct square on the board when there is one move left to play
		Given a game is being played with a computer player
		And selecting square 5 is the only spot left
		When the computer player makes a move
		Then the computer's next move matches square 5 on the board

  Scenario Outline: The Computer player selects the correct square on the board when there are multiple options and one that results in a win
		Given a game is being played with a computer player
		And there are multiple moves to make on the board <board> but one square can result in a win
		When the computer player makes a move
		Then the computer's next move matches square <winning_square> on the board
 
		Examples:
			|winning_square|board                                         |
			|5             |["X", "O", "3", "X", "5", "O", "O", "O", "X" ]|
		  |5             |["1", "O", "3", "4", "5", "O", "7", "O", "X" ]|
		  |5             |["1", "O", "3", "O", "5", "O", "7", "O", "X" ]|
		  |3             |["1", "X", "3", "X", "5", "O", "7", "X", "O" ]|
		  |5             |["1", "X", "3", "O", "5", "O", "O", "X", "9" ]|
		  |7             |["1", "X", "3", "X", "5", "6", "7", "O", "O" ]|
		  |6             |["1", "X", "O", "X", "5", "6", "7", "X", "O" ]|
		  |4             |["O", "2", "X", "4", "X", "6", "O", "8", "X" ]|
		  |2             |["O", "2", "O", "4", "5", "X", "7", "X", "9" ]|
		  |9             |["O", "2", "3", "4", "O", "6", "7", "8", "9" ]|
			|5             |["1", "2", "O", "4", "5", "6", "O", "8", "9" ]|


	Scenario Outline: The Computer player selects the correct square on the board when there are multiple options and one that is a blocking action, which prevents the other player from making a winning move
  Given a game is being played with a computer player
	And there are multiple moves to make on the board <board> but one square can result in a block
  When the computer player makes a move
	Then the computer's next move matches square <blocking_square> on the board

		Examples: 
			|blocking_square|board                                         |
			|5              |["1", "X", "3", "X", "5", "O", "O", "X", "9" ]|
      |8              |["O", "X", "3", "4", "X", "6", "7", "8", "O" ]|
		  |2              |["1", "2", "O", "4", "X", "6", "7", "X", "9" ]|
		  |4              |["X", "2", "3", "4", "5", "6", "X", "8", "9" ]|
		  |5              |["X", "2", "3", "4", "5", "6", "7", "8", "X" ]|
		  |8              |["1", "2", "3", "4", "5", "6", "X", "8", "X" ]|
		  |6              |["1", "2", "X", "4", "5", "6", "7", "8", "X" ]|
		  |4              |["X", "2", "O", "4", "5", "6", "X", "8", "9" ]|
		  |9              |["O", "X", "O", "X", "X", "O", "7", "O", "9" ]|
