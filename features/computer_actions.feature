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
		And there are multiple moves to make on the <board> but one square can result in a win
		When the computer player makes a move
		Then the computer's next move matches square <winning_square> on the board
 
		Examples:
			|winning_square|board                                         |
		  |5             |["X", "O", "3", "X", "5", "O", "O", "O", "X" ]|

