Feature: Setting up players for a game

Scenario Outline: A player can be a human or a computer
  When a <type> wants to play the game
  Then they <expectation>
		
	Examples: 
			|type    |expectation|
			|human   |can        |
			|computer|can        |
			|dog     |cannot     |
