Feature: Setting up the match type
	As a game admin
	I want to be able to configure the type of match being played
	So that people can play against each other or a computer

	Scenario: There are 3 total matches from which to select
		Given a Human wants to play the game
		Then there are three total match options available

	Scenario: A Human can play against a Human
		Given a Human wants to play the game
		When match option 1 is selected
		Then the second player is a Human

	Scenario: A Human can play against a Computer
		Given a Human wants to play the game
		When match option 2 is selected
		Then the second player is a Computer

	Scenario: A Computer can play against a Computer
		Given only a Computer is available to play
		When match option 3 is selected
		Then the second player is a Computer

