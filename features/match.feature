Feature: Setting up the match type
	As a game admin
	I want to be able to configure the type of match being played
	So that people can play against each other or a computer

	Scenario: A Human can play against a Human
		Given a Human wants to play the game
		When match option 1 is selected
		Then the second player is a Human

	Scenario: A Human can play against a Computer
		Given a Human wants to play the game
		When match option 2 is selected
		Then the second player is a Computer

