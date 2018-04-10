Feature: Setting up players for a game
	As the game admin
	I want to be able to configure the players
	So that they can customize the game play experience
	
Scenario Outline: A player can be a human or a computer
  When a <type> wants to play the game
  Then it <expectation>
		
	Examples: 
			|type    |expectation|
			|Human   |can        |
			|Computer|can        |
			|Dog     |cannot     |

	Scenario Outline: A player can customize the symbol used during game play
		When a <character> is selected
		Then it <expectation> be used

	Examples: 
			|character|expectation|
			|X        |can        |
			|a        |can        |
		  |*        |can        |
			|$        |can        |
      |#        |can        |
		  |1        |cannot     |
		  |11       |cannot     |
			|xx       |cannot     |
		  |abc      |cannot     |

	Scenario: Two players can't have the same symbol
		Given a new game is started
		And player 1 is setup with symbol "Y"
		When player 2 is setup with symbol "Y"
		Then player setup displays an error

	Scenario: Two players can have different symbols
		Given a new game is started
		And player 1 is setup with symbol "Y"
		When player 2 is setup with symbol "X"
		Then player setup is successful

