Feature: Allow players to undo the last move
	As a game admin
	I want to be able to allow a player to undo the last move played in the game
	To improve the game experience and allow the user to test out strategies during game play without having to start a new game

	Scenario: You can't undo moves when a game is played between a Computer and a Computer
		Given only a Computer is available to play
	  When match option 3 is selected
		And the game is setup
		Then there is no option to undo moves during game play

	Scenario: You can undo moves when a game is played between a Human and a Computer
		Given a Human wants to play the game
	  When match option 2 is selected
		And the game is setup
		Then there is an option to undo moves during game play

	Scenario: You can undo moves when a game is played between a Human and a Human
    Given a Human wants to play the game
	  When match option 1 is selected
		And the game is setup
		Then there is an option to undo moves during game play






