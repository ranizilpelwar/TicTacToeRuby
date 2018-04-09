Feature: Setting up players for a game

Scenario Outline: A player can be a human or a computer
  When a <type> wants to play the game
  Then it <expectation>
		
	Examples: 
			|type    |expectation|
			|human   |can        |
			|computer|can        |
			|dog     |cannot     |

	Scenario Outline: A player can setup the symbol used during game play
		When a <character> is selected
		Then it <expectation> be used

	Examples: 
			|character|expectation|
			|X        |can        |
			|a        |can        |
			|1        |cannot     |

