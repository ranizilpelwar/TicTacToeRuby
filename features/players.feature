Feature: Setting up players for the game
	There should only be two players in a game
	A player can be a human or a computer	
  A player cannot be anything else

Scenario: Select Players
	Given there is a human
	When the person plays the game
	Then the second player is a computer

	Given there are two people that want to play
	When they play the game
	Then they play against each other

	Given there is no one to join the game
	When the game is played
	Then both players are of type computer


